Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B338F8A5F67
	for <lists+samba-technical@lfdr.de>; Tue, 16 Apr 2024 02:46:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=R2at1VyBpUTFVHVAwQTUAeEMu9H4iwF5swJRAN+QyMg=; b=piYap/sC4mWB5oVQHyAY8gdMIk
	wpYK1QBmnpTB8TKDSdKw2myzqCccdyCY1IubLtusLaY+17S70QfZB/LRGpvxfT7BQLRHaQAthek+k
	a3+XTQG2hhO/mxcjLdkYDtqWePOctdUYGpi2ozYQ3zY1t11S3oj66DeCCADx+5ENFuHPSVTBH91yo
	P3QKdMj1QnFmJ+PGAH1h739pSFb2OUBPSVHWstlQUaXdyKL0S8p1s1K2KUg0uvJgNThh3PPGucgan
	/RgtgyyXFP/m8kwkR9T9E2gI1703j5z/nvGSe7+JQZDfA0YKWL6vrbHnefgs4DwNI1EYQrxSXsspa
	Oc2D2dfA==;
Received: from ip6-localhost ([::1]:27976 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rwWwx-004rfS-Ay; Tue, 16 Apr 2024 00:45:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217]:48742) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rwWws-004rfL-9X
 for samba-technical@lists.samba.org; Tue, 16 Apr 2024 00:45:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EE38D60ED0
 for <samba-technical@lists.samba.org>; Tue, 16 Apr 2024 00:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB54C3277B
 for <samba-technical@lists.samba.org>; Tue, 16 Apr 2024 00:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713227334;
 bh=R2at1VyBpUTFVHVAwQTUAeEMu9H4iwF5swJRAN+QyMg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eJ0O+gNYDB9eaf2vvRtbzxodo6u+8KwG5MiL/kSksfWPtUSYJmo56oEFxJJyTuOzh
 UtZ5RErnZ43fxLxHsQnn+PYNgl5O4Rn538mpkqw0ptefzsj3kzGgGmWMZbsxBQTKkK
 JR8QbV+/jpwuI+ZOaGv6tHX4o1TiQ9MpfwVctAk2GX8fbNRLPJhiIWGrsb2gAo4pd8
 XuLSBmKGS1JsOF5oeIYBXJUbW/vfSxVxQaWna4Q/Fknyg8WlUBV4bb7q7KvgILnwr0
 kAtNS6ZWsa/eyXAwaJ4XK35ntBZgQAqbTIbeff4uv9l3wTAkwtdDLN3ewu9JA0VCgo
 XslYHAPvErPoA==
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-22fa7e4b0beso2493324fac.1
 for <samba-technical@lists.samba.org>; Mon, 15 Apr 2024 17:28:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXQVyoPgvmhAcHaYhrwKiRbJQ558Zk994TmNyBWd8aBF/wWcpvpXplGj7rQSUvfeKC0v7P+CDq2gEJ11WVJfO7mDgi+9d0KA42Faf6Y6kR/
X-Gm-Message-State: AOJu0YxHP0RGZ7KpYQ9K1JxHDDGscPIWuUv2jyNwPwwCnodC9DuI4J+C
 F2loj4g+Z9eshzWqUU3psnkw8EFlzK8wY0mbuMfi8g+zDFdUSMpY/OWtTK6WzNp7iXfN7j+ZG0D
 bP4Hi8wy3AzGCi+pwuM6DIJ1groE=
X-Google-Smtp-Source: AGHT+IGHbmG7IqkstwyLgOdAb3XeBSVIgmOiLeUy6inVpnWQ5YydAYhBsfvKhsavzx6ZVXCcl5kFnOPpACRl9cwYQ8c=
X-Received: by 2002:a05:6870:a195:b0:229:ec87:cc29 with SMTP id
 a21-20020a056870a19500b00229ec87cc29mr15860308oaf.49.1713227333970; Mon, 15
 Apr 2024 17:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5ms7EWvNFVJ7_D7QXWOyj+oViKDJD2EuoY3n=w1c5wLTKQ@mail.gmail.com>
In-Reply-To: <CAH2r5ms7EWvNFVJ7_D7QXWOyj+oViKDJD2EuoY3n=w1c5wLTKQ@mail.gmail.com>
Date: Tue, 16 Apr 2024 09:28:42 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-gN2uQ4B9UvUdvCM_A+qnrMuCHGQO7irfFozbjKBxpZA@mail.gmail.com>
Message-ID: <CAKYAXd-gN2uQ4B9UvUdvCM_A+qnrMuCHGQO7irfFozbjKBxpZA@mail.gmail.com>
Subject: Re: current ksmbd
To: Steve French <smfrench@gmail.com>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

2024=EB=85=84 4=EC=9B=94 16=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 1:54, S=
teve French <smfrench@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> We are up to 221 fstests run vs. ksmbd, and buildbot tests pass with
> current ksmb (this is with 6.9-rc4):
> http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builders/=
10/builds/52
>
> There are lots of minor features (and some fixes) that should be able
> to be doable to increase this number even more.
>
> Note that Samba passes some tests that are skipped when run to ksmbd
> that should be investigated:
> e.g. generic/022 ("xfs_io fcollapse") and generic/351 ("xfs_io
> fsinsert") and also generic/021 and 031 ("fallocate: Invalid argument)
> and generic/525 ("pread: invalid argument") and generic/568 (which
> looks like fallocate bug)
Okay. I will check it after sambaXP.

Thanks for your check!
>
> Samba fails two tests that pass to ksmbd generic/286 ("create sparse
> file failed") and generic/591 (splice test) that also should be
> investigated.
>
>
> --
> Thanks,
>
> Steve

