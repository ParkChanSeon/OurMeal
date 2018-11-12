<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<style type="text/css">
/* helpers/alignment.css */

.align {
  align-items: center;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

/* helpers/icon.css */

.icon {
  font-size: 2rem;
}

/* layout/base.css */

html {
  height: 100%;
}

body {
  color: #888;
  font-family: sans-serif;
  line-height: 1.5;
  margin: 0;
  min-height: 100%;
}

/* modules/headline.css */

h3 {
  font-size: 1.5rem;
  margin-top: 1.5em;
  color: #111;
  margin-bottom: 1.5em;
}

/* modules/paragraph.css */

p {
  margin-bottom: 1.5em;
  margin-top: 1.5em;
}

/* modules/form.css */

input {
  font: inherit;
  outline: 0;
}

.form__field {
  position: relative;
}

.form__field .icon {
  position: absolute;
  right: 1em;
  top: 50%;
  transform: translateY(-50%)
}

.form__input {
  border-radius: 0.25em;
  border-style: solid;
  border-width: 2px;
  font-size: 1.5rem;
  padding: 0.5em 4em 0.5em 2em;
}

.form__input:valid {
  border-color: forestgreen;
}

.form__input:valid + .icon::after {
  content: '😃';
}

.form__input:invalid {
  border-color: firebrick;
}

.form__input:invalid + .icon::after {
  content: '😳';
}

	</style>
</head>

  <form>
    <div class="form__field">
      <input type="text" class="form__input" pattern=".{6,}" required>
      <span class="icon"></span>
    </div>
  </form>
