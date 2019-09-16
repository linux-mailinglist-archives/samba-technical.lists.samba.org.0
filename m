Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD3CB32C6
	for <lists+samba-technical@lfdr.de>; Mon, 16 Sep 2019 02:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=oIMyeKKEiYaWDTYrP08OOmc4Hi53wBe1rR6tg3NI/Hw=; b=k3wfIllaguXdL1EbbYwKXjMIJ3
	0DA+G5hxHe4HPkZO7ouOGul5GtfV7GeHyVnfBT2SKTiQBtl3PKyVrXykNSwMlqoXtKs4h4CgGGtct
	0dghLKUiAX58zcKYmLiMwmffAvR17dwr27tGD+Jdz3QEdA1OiHrRYN+aXTxMzA/kCtyOcyeP6K5gL
	fsO12UkF6xElgXRsitWJhGT8rQazIpqpSsKBAENGurgWiL0zpUft0BfgnLbcSVviTPGUWMr6KLQkR
	mr3z8UTYgN7qmI/VV1W7ykaLiILmYGY8nzEuT13My2op9sm2vZe17+G3BGvSNqLhyazidB0NNMkde
	bPjSMIOw==;
Received: from localhost ([::1]:46368 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i9emu-005pPj-OZ; Mon, 16 Sep 2019 00:22:40 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42611) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i9emq-005pPT-Ex
 for samba-technical@lists.samba.org; Mon, 16 Sep 2019 00:22:38 +0000
Received: by mail-wr1-x42f.google.com with SMTP id q14so37000355wrm.9
 for <samba-technical@lists.samba.org>; Sun, 15 Sep 2019 17:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=oIMyeKKEiYaWDTYrP08OOmc4Hi53wBe1rR6tg3NI/Hw=;
 b=P90H9t2MsU4HE1+xnyw/qG2JMO68Z4V7xkO4NqapzlKe9KowNkw/EdAcM7fRBa0/UH
 BG9ReWc71mmHCwt+uuCwWwDWAlTFoQ+y7vtuPa7P6x7wR+fJVUZDaS3+XsXebRXHtbC5
 0nCK9N8mGLo8YKafSlm8ckV5fwFinXjs7XVMJz1VReVoan4dYBmxrdk47FdN1QwLNiL9
 4iTMa1RrkhEf8NPxLq/hShlFUUi5ppK9BZVsifI6cxV28wMxSU+XefRooWLL5r+pgYRH
 AotqREM1kFOrbQLd+rLzH+BKeM2/upR9DYPWhnBA2KSyLAy7s4zh8VMvPYZ/+vHz1BP3
 jQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=oIMyeKKEiYaWDTYrP08OOmc4Hi53wBe1rR6tg3NI/Hw=;
 b=pXJ4BOTH/kaSH52pzIuy52pbbs+6e2r0rZiQaHtI7xDmlZKtQW33sxuWOzfyGEaPun
 PMVVASglrqv9ZUR4QJWSXF1ah0TJynj5kiUV+uZxQXLwSxq6Z6zo8kNnfbid83d9ie0S
 LZvjGGDEDr155dvV1lNgJZjqo3Ll4rWnbQV5lMhJrXT8/9l7jtmofB+BSjjjqxuE2W5C
 qCycxPILbXY/8ycRSaeVe3tqwZJQ3d486PGu/Hfg3MkzeCquWRUYbwltZk5VnOaz0ULN
 Mu82kn9nL7SHdVMh/nm5TGdaNjDPrIesK3ktkwyG2IScX+glqHIO7/azfDqmKjJlx2VA
 /ShA==
X-Gm-Message-State: APjAAAWfgFDdxytSpbwIyKmktTWtgsQ1cOJh1FpTH9a8Fz/T8FjQZW/j
 VBRtGWr95Fsk2YdTpinG+k1N+n/BB5VURRVgWoOTsKicpCQ=
X-Google-Smtp-Source: APXvYqzJLRiFtWic5rDgEXj+E08wAGoBF+q8WkjH+1k4SjNMtXXcmXVawUMFN13/3qzR/tsoyyhNlfvc/YSmK+RluEs=
X-Received: by 2002:a5d:4e89:: with SMTP id e9mr3593592wru.48.1568593355501;
 Sun, 15 Sep 2019 17:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPxfTd-DOVA3L1eqF_RZa_iKnnPEtiwX7dQP3jRr9kx3tw@mail.gmail.com>
 <20190916001515.GA18760@jeremy-acer>
In-Reply-To: <20190916001515.GA18760@jeremy-acer>
Date: Sun, 15 Sep 2019 17:19:40 -0700
Message-ID: <CACyXjPw-2t+f8ZSGvCJCenPO1f1JPXkKZmdH+CZKZZ9WfHgLRg@mail.gmail.com>
Subject: Re: Is it correct to have an INHERIT_ONLY, CI, OI ace with
 GENERIC_ALL as the only perm set?
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Sep 15, 2019 at 5:15 PM Jeremy Allison <jra@samba.org> wrote:
>
> On Sun, Sep 15, 2019 at 05:04:17PM -0700, Richard Sharpe via samba-techni=
cal wrote:
> > Hi folks,
> >
> > I have a capture from a GET INFO SEC INFO from a NetApp C-Mode
> > simulator where one of the two ACEs on a dir is an IO, CI, OI ACE with
> > GENERIC_ALL as its only permission bit set.
> >
> > Is this legal?
> >
> > If so, I guess it maps to 0x1f01ff
>
> Isn't that the equivalent of a POSIX directory
> inheritance ACE of wrx ?

Well, it seems that Windows does allow it, if this is to be believed:

https://stackoverflow.com/questions/25163174/get-generic-folder-permissions=
-like-generic-all-using-javas-aclfileattributev

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

