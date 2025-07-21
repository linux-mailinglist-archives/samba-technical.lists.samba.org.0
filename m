Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B405CB0B979
	for <lists+samba-technical@lfdr.de>; Mon, 21 Jul 2025 02:06:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tXeIerK3aV86uaA4LpJJ4yTl1PsEdK0JH+Lx0S4zs2U=; b=MPgQNjgLrFjXI0v5peFEQG1CSx
	OnxkqES+wkl/UCo+HY/lQQ6kXeDsIT624LSgNVbP/21N4htmQB5kEqGVZjI79AXUJfP93bXiiybit
	rZGmljpT7lLICHSfom7rzicvFUZZitPcgYcAvq47c/zhG62XvFlEfeYLJHC3nWFRUQWue8NKODqdw
	oQ1VcrAMDE+SwIgnLbrCMQqde1t20AH60HkCHWdPc4xN2lkeYHBaAD+2BP7AX6yqKoxe6x7a+BHTK
	Xp/FfPo5FLdjXMGZc1fn5vT2t/aAXk+/nZb5FFfFmvwtYW/JsiOdUmT+Hj6TvHWp3YAngTDCgs6V3
	hDvqkKKg==;
Received: from ip6-localhost ([::1]:62540 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ude2Q-00BY7x-Fs; Mon, 21 Jul 2025 00:05:50 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:52582) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ude2J-00BY7l-Rj
 for samba-technical@lists.samba.org; Mon, 21 Jul 2025 00:05:46 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-6fad4a1dc33so35491856d6.1
 for <samba-technical@lists.samba.org>; Sun, 20 Jul 2025 17:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753056341; x=1753661141; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tXeIerK3aV86uaA4LpJJ4yTl1PsEdK0JH+Lx0S4zs2U=;
 b=kAkysj0HQ4J4+TLJyKBWbTphakQ3ExH5N7ObODzAjIXSlF2oWNzqYuMjoLxP5MulwI
 dOxNm6KOcFV5pCYViV+yMniKVsOhWf066piySYFtAgUZfCXeuK3V0aDhQgN/SBtJxtt9
 20oQ8wVbXSILTkUvCNnvJG1IDK4RlFHeWtr6einvHfxZTWNOUF2kxDdM81758Awoz4gQ
 RYwa2o7imylqNePSj5BBSOj+MAKBVGLH8Ctv31/5Hr7GEqjxPSF9qvLuMKWnOepsaCLW
 /HSaT/W5EFoiy8eezTwaHnjHOjW4xAXXHDAYhqCZiWJ7RAknM21dqjhMsfWXrA3fItlq
 qiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753056341; x=1753661141;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tXeIerK3aV86uaA4LpJJ4yTl1PsEdK0JH+Lx0S4zs2U=;
 b=hWVh5dlWtTxyC3jt41PAWtyopQOwJfV8opT4gCfdxPM4Hc7R6PfWtRNSzas6ffZSSo
 eSMvYvK5OLNduamt4eaVEPH/L84rTc5Pv6QOiel7EAXz6oCIELi3eBKTFZb94/WJBXC2
 W5S6tNgxvinj84WGzI2Qou7FWYYyHb2B/DPbIo3SYG+xpMWqUa2TYNhXlwyQg8gCgKU7
 Jy7pswD6kUtSSRD534jodVHi+Ad5fmb6lgnckBtatqMJexgdfySarzevoIgoZnovZGYg
 h1FFeP/hXJn4QJY0+av648OShov49FfwbxCdpv4mFXAHbVtk2klzndvtckBSAIrXWUW0
 lQfg==
X-Gm-Message-State: AOJu0Yw+BvhujLj5g2YgxzeMLcG4PIBI3UwYP55sly9ZHjWBBV8wGAnh
 odtpy0crcx+XTXg0OnlFe3MbcBNBTVlDc4UhTxQ4Sw1LePNLnAiRl9+M9axGt4uTXpGBclQ17DB
 GlpJNW5dBKrvPbpGPyx5Zx6Vgo0k2IYwQw32K5O0=
X-Gm-Gg: ASbGncuJvU/ptIfJFyBsWANKFtMF0pQOCpz9nZoJyNfhWU8hKvolju/Nmmrg7RX7DKa
 4GMgb6lp2mStupoqxMQqyBikHiMjblI4QxRbpLtRXchRF7H2eBlt6s6ob14liSn80VTmKhQnkiH
 e9HkJ+0kLTpIkkhuzUsyXWfbjgfEcGqoUQEI7YF9tWhONiXx/OyowmS4AYaHDWosIDKebXWEwRC
 NrvlMJKRMHvb6XoqbAYYpNapI4J3ZK6gOI/wWR9Pw==
X-Google-Smtp-Source: AGHT+IHePbFOpLuF7+RUEbbDVGapIzqTm/b+9jYm+LsYMqtfu5B0kKTrbqoarPUFQ92f75P9L5zw+TnV3ctwEEm+Nss=
X-Received: by 2002:ad4:5bef:0:b0:702:d6e7:18bf with SMTP id
 6a1803df08f44-704f69eb3d0mr251942066d6.3.1753056341224; Sun, 20 Jul 2025
 17:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5msVdabcDudGyR47StT_VoKazD_A0kdAaGMRh+UD060PhQ@mail.gmail.com>
In-Reply-To: <CAH2r5msVdabcDudGyR47StT_VoKazD_A0kdAaGMRh+UD060PhQ@mail.gmail.com>
Date: Sun, 20 Jul 2025 19:05:29 -0500
X-Gm-Features: Ac12FXxPGouuhGf3Zg338WxXL4xxpSJSyzePBFIUGWQ6reALM5UfwW6v0ANev9A
Message-ID: <CAH2r5mtQ1CnAph8mvuFQ3bhhPwHqiCM4OZ74cuf_55PmUYZvKA@mail.gmail.com>
Subject: Re: Updated SMB3.1.1 POSIX testing results to Samba
To: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000007e2c83063a653c38"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000007e2c83063a653c38
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have also done a detailed test run of all tests to ksmbd with
"linux" (SMB3.1.1 POSIX Extensions) with current mainline and 215 test
cases pass (some different than what pass and fail to Samba so likely
some SMB3.1.1 POSIX extensions server bugs in both ksmbd and Samba,
not just client bugs).  A large number of the client test case
failures look to be related to a possible deferred close client bug
which causes "directory not empty" at the end of various tests.

Here is the detailed test results to Samba with SMB3.1.1 POSIX Extensions:
  https://wiki.samba.org/index.php/Xfstest-results-Samba-Linux

and here for comparison is the detailed results to ksmbd with the
SMB3.1.1 POSIX Extensions
  https://wiki.samba.org/index.php/Xfstest-results-ksmbd

Both are obviously much better than previous releases so there has
been much improvement.  Very promising.

Also attached are two scripts - one to run all tests that are expected
to pass to Samba, and the other which runs all tests that are expected
to pass to ksmb.  I will be updating the 'buildbot' regression testing
suite based on this so we don't have any regressions slip through as
implementation of the SMB3.1.1 POSIX Extensions continues to improve.


On Thu, Jul 17, 2025 at 11:07=E2=80=AFPM Steve French <smfrench@gmail.com> =
wrote:
>
> I have done a detailed update of the passing and failing and skipped
> (e.g. when test only relevant to local filesystems) tests, and updated
> the wiki page so others can add their observations etc.  See below:
>
>     https://wiki.samba.org/index.php/Xfstest-results-Samba-Linux
>
> There are 231 currently passing xfstests from current Linux client to
> current Samba which is very good news.
>
> Attached is a script ("run-smb311-linux-tests) which will run all 231
> passing tests.
>
> The failing tests are listed clearly in the wiki, and likely many of
> them are going to be easy fixes (especially those failing with
> incorrect mode bits or unexpected access denied).  Fixes welcome,
> since there are about 140 tests to dig into more (many of which may
> eventually turn out not to be relevant).
>
> As we fix additional of these, I plan to remove the "experimental"
> warning that log during mount with "linux" (or "posix") for smb3.1.1
> client mounts, since I am seeing huge benefits with the SMB3.1.1
> Linux/POSIX extensions already.
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

--0000000000007e2c83063a653c38
Content-Type: application/octet-stream; name=run-smb311-linux-tests-ksmbd
Content-Disposition: attachment; filename=run-smb311-linux-tests-ksmbd
Content-Transfer-Encoding: base64
Content-ID: <f_mdccemm20>
X-Attachment-Id: f_mdccemm20

Li9jaGVjayAtY2lmcyBjaWZzLzAwMSBnZW5lcmljLzAwMSBnZW5lcmljLzAwMiBnZW5lcmljLzAw
NSBnZW5lcmljLzAwNiBnZW5lcmljLzAwNyBnZW5lcmljLzAwOCBnZW5lcmljLzAxMCBnZW5lcmlj
LzAxMSBnZW5lcmljLzAxMyBnZW5lcmljLzAxNCBnZW5lcmljLzAyMCBnZW5lcmljLzAyMyBnZW5l
cmljLzAyNCBnZW5lcmljLzAyOCBnZW5lcmljLzAyOSBnZW5lcmljLzAzMCBnZW5lcmljLzAzMiBn
ZW5lcmljLzAzMyBnZW5lcmljLzAzNiBnZW5lcmljLzAzNyBnZW5lcmljLzA0MyBnZW5lcmljLzA0
NCBnZW5lcmljLzA0NSBnZW5lcmljLzA0NiBnZW5lcmljLzA0NyBnZW5lcmljLzA0OCBnZW5lcmlj
LzA0OSBnZW5lcmljLzA1MSBnZW5lcmljLzA2OSBnZW5lcmljLzA3MCBnZW5lcmljLzA3MSBnZW5l
cmljLzA3MiBnZW5lcmljLzA3NCBnZW5lcmljLzA4MCBnZW5lcmljLzA4NCBnZW5lcmljLzA4NiBn
ZW5lcmljLzA5MSBnZW5lcmljLzA5NSBnZW5lcmljLzA5OCBnZW5lcmljLzEwMCBnZW5lcmljLzEw
MyBnZW5lcmljLzEwOSBnZW5lcmljLzExMCBnZW5lcmljLzExMSBnZW5lcmljLzExMiBnZW5lcmlj
LzExMyBnZW5lcmljLzExNSBnZW5lcmljLzExNiBnZW5lcmljLzExNyBnZW5lcmljLzExOCBnZW5l
cmljLzExOSBnZW5lcmljLzEyNCBnZW5lcmljLzEyNSBnZW5lcmljLzEyNyBnZW5lcmljLzEyOSBn
ZW5lcmljLzEzMCBnZW5lcmljLzEzMiBnZW5lcmljLzEzMyBnZW5lcmljLzEzNCBnZW5lcmljLzEz
NSBnZW5lcmljLzEzOCBnZW5lcmljLzEzOSBnZW5lcmljLzE0MCBnZW5lcmljLzE0MSBnZW5lcmlj
LzE0MiBnZW5lcmljLzE0MyBnZW5lcmljLzE0NCBnZW5lcmljLzE0NiBnZW5lcmljLzE0OCBnZW5l
cmljLzE0OSBnZW5lcmljLzE1MCBnZW5lcmljLzE1MSBnZW5lcmljLzE1MiBnZW5lcmljLzE1MyBn
ZW5lcmljLzE1NCBnZW5lcmljLzE1NSBnZW5lcmljLzE2OSBnZW5lcmljLzE3OCBnZW5lcmljLzE3
OSBnZW5lcmljLzE4MCBnZW5lcmljLzE4MSBnZW5lcmljLzE5OCBnZW5lcmljLzIwNyBnZW5lcmlj
LzIwOCBnZW5lcmljLzIwOSBnZW5lcmljLzIxMCBnZW5lcmljLzIxMiBnZW5lcmljLzIxNCBnZW5l
cmljLzIxNSBnZW5lcmljLzIyMSBnZW5lcmljLzIyNSBnZW5lcmljLzIyOCBnZW5lcmljLzIzNiBn
ZW5lcmljLzIzOSBnZW5lcmljLzI0MSBnZW5lcmljLzI0NSBnZW5lcmljLzI0NiBnZW5lcmljLzI0
NyBnZW5lcmljLzI0OCBnZW5lcmljLzI0OSBnZW5lcmljLzI1NSBnZW5lcmljLzI1NyBnZW5lcmlj
LzI1OCBnZW5lcmljLzI4NSBnZW5lcmljLzMwOCBnZW5lcmljLzMwOSBnZW5lcmljLzMxMCBnZW5l
cmljLzMxMyBnZW5lcmljLzMxNSBnZW5lcmljLzMxNiBnZW5lcmljLzMyMyBnZW5lcmljLzMzNyBn
ZW5lcmljLzMzOSBnZW5lcmljLzM0MCBnZW5lcmljLzM0NCBnZW5lcmljLzM0NSBnZW5lcmljLzM0
NiBnZW5lcmljLzM1NCBnZW5lcmljLzM2MCBnZW5lcmljLzM2MiBnZW5lcmljLzM2NCBnZW5lcmlj
LzM2NiBnZW5lcmljLzM3NyBnZW5lcmljLzM3OCBnZW5lcmljLzM5MSBnZW5lcmljLzM5MiBnZW5l
cmljLzM5MyBnZW5lcmljLzM5NCBnZW5lcmljLzQwNiBnZW5lcmljLzQwNyBnZW5lcmljLzQxMiBn
ZW5lcmljLzQxNyBnZW5lcmljLzQyMCBnZW5lcmljLzQyMiBnZW5lcmljLzQyOCBnZW5lcmljLzQz
MCBnZW5lcmljLzQzMSBnZW5lcmljLzQzMiBnZW5lcmljLzQzMyBnZW5lcmljLzQzNiBnZW5lcmlj
LzQzNyBnZW5lcmljLzQzOCBnZW5lcmljLzQzOSBnZW5lcmljLzQ0MyBnZW5lcmljLzQ0NSBnZW5l
cmljLzQ0NiBnZW5lcmljLzQ0OCBnZW5lcmljLzQ1MSBnZW5lcmljLzQ1MiBnZW5lcmljLzQ2MCBn
ZW5lcmljLzQ2MSBnZW5lcmljLzQ2MyBnZW5lcmljLzQ2NCBnZW5lcmljLzQ2NSBnZW5lcmljLzQ2
OCBnZW5lcmljLzQ2OSBnZW5lcmljLzQ3MSBnZW5lcmljLzQ3NCBnZW5lcmljLzQ3NiBnZW5lcmlj
LzQ5MCBnZW5lcmljLzQ5MSBnZW5lcmljLzQ5OSBnZW5lcmljLzUwNCBnZW5lcmljLzUyMyBnZW5l
cmljLzUyNCBnZW5lcmljLzUyNSBnZW5lcmljLzUyOCBnZW5lcmljLzUzMiBnZW5lcmljLzUzMyBn
ZW5lcmljLzU1MSBnZW5lcmljLzU2NyBnZW5lcmljLzU2OCBnZW5lcmljLzU3MSBnZW5lcmljLzU5
MCBnZW5lcmljLzU5MSBnZW5lcmljLzU5OSBnZW5lcmljLzYwNCBnZW5lcmljLzYwOSBnZW5lcmlj
LzYxMCBnZW5lcmljLzYxMiBnZW5lcmljLzYxNSBnZW5lcmljLzYxNiBnZW5lcmljLzYxNyBnZW5l
cmljLzYxOCBnZW5lcmljLzYzMiBnZW5lcmljLzYzNyBnZW5lcmljLzYzOCBnZW5lcmljLzYzOSBn
ZW5lcmljLzY0MiBnZW5lcmljLzY0NiBnZW5lcmljLzY0NyBnZW5lcmljLzY1MCBnZW5lcmljLzY3
NiBnZW5lcmljLzY3OCBnZW5lcmljLzY5NCBnZW5lcmljLzcwMSBnZW5lcmljLzcwNiBnZW5lcmlj
LzcwNyBnZW5lcmljLzcwOCBnZW5lcmljLzcyOCBnZW5lcmljLzcyOSBnZW5lcmljLzczNiBnZW5l
cmljLzczNyBnZW5lcmljLzc0MiBnZW5lcmljLzc0OCBnZW5lcmljLzc0OSBnZW5lcmljLzc1MCBn
ZW5lcmljLzc1MSBnZW5lcmljLzc1NSBnZW5lcmljLzc1OCBnZW5lcmljLzc1OSBnZW5lcmljLzc2
MCBnZW5lcmljLzc2MSBnZW5lcmljLzc2Mwo=
--0000000000007e2c83063a653c38
Content-Type: application/octet-stream; name=run-smb311-linux-tests-samba
Content-Disposition: attachment; filename=run-smb311-linux-tests-samba
Content-Transfer-Encoding: base64
Content-ID: <f_mdccewuz1>
X-Attachment-Id: f_mdccewuz1

Li9jaGVjayAtY2lmcyBjaWZzLzAwMSBnZW5lcmljLzAwMSBnZW5lcmljLzAwMiBnZW5lcmljLzAw
NSBnZW5lcmljLzAwNiBnZW5lcmljLzAwNyBnZW5lcmljLzAwOCBnZW5lcmljLzAxMCBnZW5lcmlj
LzAxMSBnZW5lcmljLzAxMiBnZW5lcmljLzAxMyBnZW5lcmljLzAxNCBnZW5lcmljLzAxNiBnZW5l
cmljLzAyMCBnZW5lcmljLzAyMSBnZW5lcmljLzAyMiBnZW5lcmljLzAyMyBnZW5lcmljLzAyNCBn
ZW5lcmljLzAyOCBnZW5lcmljLzAyOSBnZW5lcmljLzAzMCBnZW5lcmljLzAzMSBnZW5lcmljLzAz
MiBnZW5lcmljLzAzMyBnZW5lcmljLzAzNiBnZW5lcmljLzAzNyBnZW5lcmljLzA0MyBnZW5lcmlj
LzA0NCBnZW5lcmljLzA0NSBnZW5lcmljLzA0NiBnZW5lcmljLzA0NyBnZW5lcmljLzA0OCBnZW5l
cmljLzA0OSBnZW5lcmljLzA1MSBnZW5lcmljLzA2NCBnZW5lcmljLzA2OCBnZW5lcmljLzA2OSBn
ZW5lcmljLzA3MCBnZW5lcmljLzA3MSBnZW5lcmljLzA3MiBnZW5lcmljLzA3NCBnZW5lcmljLzA3
NSBnZW5lcmljLzA4MCBnZW5lcmljLzA4NCBnZW5lcmljLzA4NiBnZW5lcmljLzA5MSBnZW5lcmlj
LzA5NSBnZW5lcmljLzA5OCBnZW5lcmljLzEwMCBnZW5lcmljLzEwMyBnZW5lcmljLzEwOSBnZW5l
cmljLzExMCBnZW5lcmljLzExMSBnZW5lcmljLzExMiBnZW5lcmljLzExMyBnZW5lcmljLzExNSBn
ZW5lcmljLzExNiBnZW5lcmljLzExNyBnZW5lcmljLzExOCBnZW5lcmljLzExOSBnZW5lcmljLzEy
NCBnZW5lcmljLzEyNSBnZW5lcmljLzEyNyBnZW5lcmljLzEyOSBnZW5lcmljLzEzMCBnZW5lcmlj
LzEzMiBnZW5lcmljLzEzMyBnZW5lcmljLzEzNCBnZW5lcmljLzEzNSBnZW5lcmljLzEzOCBnZW5l
cmljLzEzOSBnZW5lcmljLzE0MCBnZW5lcmljLzE0MSBnZW5lcmljLzE0MiBnZW5lcmljLzE0MyBn
ZW5lcmljLzE0NCBnZW5lcmljLzE0NSBnZW5lcmljLzE0NiBnZW5lcmljLzE0NyBnZW5lcmljLzE0
OCBnZW5lcmljLzE0OSBnZW5lcmljLzE1MCBnZW5lcmljLzE1MSBnZW5lcmljLzE1MiBnZW5lcmlj
LzE1MyBnZW5lcmljLzE1NCBnZW5lcmljLzE1NSBnZW5lcmljLzE2OSBnZW5lcmljLzE3OCBnZW5l
cmljLzE3OSBnZW5lcmljLzE4MCBnZW5lcmljLzE4MSBnZW5lcmljLzE4NCBnZW5lcmljLzE5OCBn
ZW5lcmljLzIwNyBnZW5lcmljLzIwOCBnZW5lcmljLzIwOSBnZW5lcmljLzIxMCBnZW5lcmljLzIx
MiBnZW5lcmljLzIxNCBnZW5lcmljLzIxNSBnZW5lcmljLzIyMSBnZW5lcmljLzIyNSBnZW5lcmlj
LzIyOCBnZW5lcmljLzIzNiBnZW5lcmljLzIzOSBnZW5lcmljLzI0MSBnZW5lcmljLzI0NSBnZW5l
cmljLzI0NiBnZW5lcmljLzI0NyBnZW5lcmljLzI0OCBnZW5lcmljLzI0OSBnZW5lcmljLzI1NSBn
ZW5lcmljLzI1NyBnZW5lcmljLzI1OCBnZW5lcmljLzI2MyBnZW5lcmljLzI5NCBnZW5lcmljLzMw
NiBnZW5lcmljLzMwOCBnZW5lcmljLzMwOSBnZW5lcmljLzMxMCBnZW5lcmljLzMxMyBnZW5lcmlj
LzMxNSBnZW5lcmljLzMxNiBnZW5lcmljLzMyMyBnZW5lcmljLzMzNyBnZW5lcmljLzMzOSBnZW5l
cmljLzM0MCBnZW5lcmljLzM0NCBnZW5lcmljLzM0NSBnZW5lcmljLzM0NiBnZW5lcmljLzM1NCBn
ZW5lcmljLzM2MCBnZW5lcmljLzM2MiBnZW5lcmljLzM2NCBnZW5lcmljLzM2NiBnZW5lcmljLzM3
NyBnZW5lcmljLzM5MCBnZW5lcmljLzM5MSBnZW5lcmljLzM5MiBnZW5lcmljLzM5MyBnZW5lcmlj
LzM5NCBnZW5lcmljLzQwNiBnZW5lcmljLzQwNyBnZW5lcmljLzQxMiBnZW5lcmljLzQxNyBnZW5l
cmljLzQyMCBnZW5lcmljLzQyMiBnZW5lcmljLzQyMyBnZW5lcmljLzQyOCBnZW5lcmljLzQzMCBn
ZW5lcmljLzQzMSBnZW5lcmljLzQzMiBnZW5lcmljLzQzMyBnZW5lcmljLzQzNCBnZW5lcmljLzQz
NiBnZW5lcmljLzQzNyBnZW5lcmljLzQzOCBnZW5lcmljLzQzOSBnZW5lcmljLzQ0MyBnZW5lcmlj
LzQ0NSBnZW5lcmljLzQ0NiBnZW5lcmljLzQ0OCBnZW5lcmljLzQ1MSBnZW5lcmljLzQ1MiBnZW5l
cmljLzQ2MCBnZW5lcmljLzQ2MSBnZW5lcmljLzQ2MyBnZW5lcmljLzQ2NCBnZW5lcmljLzQ2NSBn
ZW5lcmljLzQ2OSBnZW5lcmljLzQ3MSBnZW5lcmljLzQ3NCBnZW5lcmljLzQ3NiBnZW5lcmljLzQ5
MSBnZW5lcmljLzQ5OSBnZW5lcmljLzUwNCBnZW5lcmljLzUyMyBnZW5lcmljLzUyNCBnZW5lcmlj
LzUyNSBnZW5lcmljLzUyOCBnZW5lcmljLzUzMiBnZW5lcmljLzUzMyBnZW5lcmljLzU1MSBnZW5l
cmljLzU2NCBnZW5lcmljLzU2NSBnZW5lcmljLzU2NyBnZW5lcmljLzU2OCBnZW5lcmljLzU3MSBn
ZW5lcmljLzU4NiBnZW5lcmljLzU5MCBnZW5lcmljLzU5MSBnZW5lcmljLzU5OSBnZW5lcmljLzYw
NCBnZW5lcmljLzYwOSBnZW5lcmljLzYxMCBnZW5lcmljLzYxMiBnZW5lcmljLzYxNSBnZW5lcmlj
LzYxNiBnZW5lcmljLzYxNyBnZW5lcmljLzYxOCBnZW5lcmljLzYyMyBnZW5lcmljLzYzMiBnZW5l
cmljLzYzOCBnZW5lcmljLzYzOSBnZW5lcmljLzY0MiBnZW5lcmljLzY0NiBnZW5lcmljLzY0NyBn
ZW5lcmljLzY1MCBnZW5lcmljLzY3NiBnZW5lcmljLzY3OCBnZW5lcmljLzY4MCBnZW5lcmljLzY5
NCBnZW5lcmljLzcwMSBnZW5lcmljLzcwNSBnZW5lcmljLzcwNiBnZW5lcmljLzcwOCBnZW5lcmlj
LzcyOCBnZW5lcmljLzcyOSBnZW5lcmljLzczNiBnZW5lcmljLzczNyBnZW5lcmljLzc0MiBnZW5l
cmljLzc0OCBnZW5lcmljLzc0OSBnZW5lcmljLzc1MSBnZW5lcmljLzc1NSBnZW5lcmljLzc1OCBn
ZW5lcmljLzc1OSBnZW5lcmljLzc2MCBnZW5lcmljLzc2MSBnZW5lcmljLzc2MyAK
--0000000000007e2c83063a653c38--

