FROM jekyll/jekyll:3.8 as build-env
RUN mkdir /src
WORKDIR /src
COPY Gemfile* /src/
RUN bundle
COPY . /src
RUN chown -R jekyll:jekyll /src
RUN jekyll build --verbose

FROM nginx:1.19-alpine
COPY --from=build-env /src/_site/ /usr/share/nginx/html
