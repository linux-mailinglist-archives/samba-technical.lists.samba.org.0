Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 476E42144EF
	for <lists+samba-technical@lfdr.de>; Sat,  4 Jul 2020 13:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=EWPF0OW/mbJe1hAWm2Yc6pizAktVri9cmqSld7jn7jo=; b=O6v8BfLnpY8Sbf0MIxDyM+V/W9
	X9NjIw3gJTbcur6AryCHsQwe6JHuoNRcUtP9pUR9oO9HgOwWN5XD7v/CIDVaO3u5Z764hafVAQpIT
	jndnBOtmsKGxqxNt18u0opRnZzcgr1p4TUuZvJdNVu/IoQXvwMu4E99BCUlvOcyGkUWEEcPvbpFAs
	YAmRcN/brkr5tlcXljBjziZ1WmovLNdbImg185e5mNWVnxQK0VW/M4Z3qJpbgXFsXXRPsxv1GwdAU
	Rp7VU5p8hs3ozD4lenstXkIL5jhD6gVv38VTs6NvFsY2HKa1yiWmu4Nfgu4NXH8sl9qrqaFwmkkwv
	9SzNbMJg==;
Received: from localhost ([::1]:39722 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jrg4U-005S4x-Ud; Sat, 04 Jul 2020 11:11:03 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33768) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jrg4M-005S4o-AT
 for samba-technical@lists.samba.org; Sat, 04 Jul 2020 11:10:57 +0000
Received: by mail-ej1-x62d.google.com with SMTP id n26so23118210ejx.0
 for <samba-technical@lists.samba.org>; Sat, 04 Jul 2020 04:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2+xPdS6ffG8rq801TGe6Agc+sUFD7CGS0tNX+sVbnaI=;
 b=BqQ3NAR4Xc4fMJVhct1AE/x4q0KBe70Dvw5yWB2FXxP7nUDuiI5vSSmDLJ6ZPXBC28
 /IdceWhPLehxrF5hb6iy293yqljkrcC0QG2Oz1oo5j5OTlj/f8hDFQla9dEZtI+Xu5dN
 4GYEc3RMD2bvmLVb1QOWjmJRoDSpxFpJxb3oigeJs7lNd4tCE1X2WmseJA2E2WgqvAYG
 5R1bpt6wMWQt8r6CTeyiDs9TwKInxPljU1SuXS0pS7FwUSTE8ji59h5tW5ujbvweY9RZ
 JJgJ/YnI6GJmz9QKgCHlSNoQEeYgP2FvzodT7QtBb6xXs3pGy6bc2iS88V7/+c29ynWD
 Xb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2+xPdS6ffG8rq801TGe6Agc+sUFD7CGS0tNX+sVbnaI=;
 b=lunf2IMGMx4tmMLU6TiWRNG9NAYPa07fitOel6xn5b4RoBGdF5ZRk2zMPHE9WNBbrh
 tld7AeEs8nNDBZxAKQwdBi/J1T5SVTJm/dUOW6+sJ/7itXXzkFFIeRI48cNfWV6V/zgx
 KYQLq8LuaIMEShAUdhp5i1k+lqEKaNqNEiFRHIyENgYPCxn8CVDkwzAEscFfUGY18Fkw
 TB0xWNz0WZyY+slI18kGsxB0X5Yv8n89pZqQx9HG8E0LmXpmJ0csXgMJU5lzsvll/ciJ
 CAhqkW4GmwN9RxJsmZnrwfOGalHAk0HI2VaD0+DOfKMjfDoPwxu3kKk9MMuMFv38khXT
 92SA==
X-Gm-Message-State: AOAM532Awoa1h7FWhsQRXfEbp/prO3tVuUevqkP3QbchBIgLa/C9qOMg
 eJGxAy55/WPIZE6uingvVM+1N1BfgUfOpIUzzcDkjOei
X-Google-Smtp-Source: ABdhPJyi5K5ajxbNND91VUXGZF1rwoTzxvKfB+hI4h8kmWQZ9liOu6eW6vRDMpBOlr5h/ytb6nUTRCZunn2TXlBnzb8=
X-Received: by 2002:a17:906:5fc4:: with SMTP id
 k4mr35734724ejv.94.1593861051689; 
 Sat, 04 Jul 2020 04:10:51 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 4 Jul 2020 14:05:24 +0300
Message-ID: <CAH72RCUABcQkZ3yyWzATYi0ZeUTsLGGi90Kbk7ySAY6Z-BZSJg@mail.gmail.com>
Subject: GSoC Update and Phase One Feedback
To: Alexander Bokovoy <ab@samba.org>, "abartlet@samba.org" <abartlet@samba.org>,
 Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>,
 David Disseldorp <ddiss@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi mentors,

I'm glad to have successfully completed phase one of the GSoC. I'm really
grateful for the support and help you have provided during that time.

I wanted to give you feedback regarding the concerns raised in the just
concluded phase one review and an update on building the packages for
various distributions.

On writing a blog post on the work already done, I was thinking about
writing it at the end of phase two as the project would be more mature than
it's current state with some tests and build packages for the different
distributions.

About my experience working with samba-tool, I hadn't had many problems
working with it but to create a new user you have two options: create and
add. There were some discussions on the mailing list about this and I think
the verdict was to proceed with one and depreciate the other.

Another issue I encountered was using samba-tool dns in which you have to
pass in your administrator password for the realm interactively on the
console or as a flag. With other commands this was not a requirement and
i'm not sure why it is required with dns management.

Other than those two things the documentation for the sub-commands is
wonderful and has really good examples.

I have decided to work with the Open Build Service, from the recommendation
made by Alexander, to build the packages for various distributions. I was
making the assumption that the most popular distributions used with Samba
AD DC are RPM and Debian based. I'm seeking the community's feedback so as
not to make the wrong assumptions on this.
I created an account with the build.opensuse.org and have been exploring
the UI and going through the documentation for OBS. I also created a
Webhook in Gitlab to push the code to build.opensuse.org when there is a
commit in the master branch. Is this the right way to do it or is there
another option?

I also wanted to work on a better UI with some of the commands e.g showing
the computer AD object. The current way for listing the results uses an
alert group which isn't scrollable and can be a limitation when working
with small screen sizes. I feel a better way to do it is to use a modal in
which they appear on a list as they would on the console and make it
scrollable if they don't fit on the current screen. There was also a
suggestion from David on having to submit form input using the enter key
and I will also work on it.

Thank you.
