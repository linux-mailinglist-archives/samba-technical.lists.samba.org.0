Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FC91235B2
	for <lists+samba-technical@lfdr.de>; Tue, 17 Dec 2019 20:29:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OpYQPQe1HwFaAsb90htjmJcKyc3ByZSNVHqHflcR4q8=; b=l4a/2MbtdmARZMGWhdRTSZVDRx
	urYNbtLxU205besLx9EBiuyE5viPA7E7ovusZbtweyq0nP4szCR20MphtbfKd2Mtb6UoiMKqB10K2
	MQxPU3U7HnTI2yNfhrvP2FrTw1txGoX3V6XxKAbFu84/kfDAkz7Yks8+sbxHS7SlH+yLl3rRlONNy
	IpNZ+Xpa6Ou3XUxFdU03ySht/9ItOsaTuVlqk5eF3xEkGRKxVh9J8UobzsV4Bk0O1QVpA/Z60uqeO
	r5rk0Ygr7tnTiZ9esiYUMpEGgE1jwuNzND42aJx/snQFtp01n2hgdDEcsc6up/wXVQe3+J5saHqzl
	9y+sck2g==;
Received: from localhost ([::1]:21382 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ihIWg-007Xn7-B2; Tue, 17 Dec 2019 19:28:58 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:37909) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ihIWa-007Xmz-V1
 for samba-technical@lists.samba.org; Tue, 17 Dec 2019 19:28:55 +0000
Received: by mail-il1-x144.google.com with SMTP id f5so9386379ilq.5
 for <samba-technical@lists.samba.org>; Tue, 17 Dec 2019 11:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ulkuderner.net; s=ulkuderner.net;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=foY/Q8XFfWSkj7qQQJz4nkFezK0GDDdpR41FOlpWZKo=;
 b=P9bchSEpjUbelDzxf7KhKjE1KALpbid1/sBdzi18ll4e1JnRVkmo7RxS2SesHUmYiR
 UvgO2U0o/RWKPhqSkD0BMrm3Cq0yYiXjwecGCYYoD9XufM0QnDDojSNrw76zhUdFBQrf
 6MPuBYycrwfH9ER4h03k4EzYCR730I7VcTJoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=foY/Q8XFfWSkj7qQQJz4nkFezK0GDDdpR41FOlpWZKo=;
 b=ZRPBO7AQCWQDevm3y/0ZwoRM42U+jRxLQPWS9trVNP3WVwfLQQX1l6QNRTYaZFXUwk
 spb2wDegPthrVyVvJmPpAiYgJayezNVtRya5kGWpk1Fl2AJ7s9lU8P7ffugS0WzmalA/
 EPxVF3QP+bZGG1p2qmPvyUi+zhP3bE+ePp6FWE5g2WvWvctzB39+GINmiN92Eow6Bzam
 jyVKoSLYPLxp+5MhuCCu0SLXUQ8GEbRHwo27ocQ8YmDoDMMmrtcgNbq+IPyA0xhdr33d
 I9Rda+ywKl7F0ljO7aykMAkOGbmsdR0H05zqWV3mMOyPlxyJdnIqe5RCsjLwHaEtlagJ
 0wMw==
X-Gm-Message-State: APjAAAXuXykLXbs4+XZHvGb0Xw3QJVBS8JbYy9KMijOHNvba7FPZF1j/
 yoTF3QM0sOjnAaEMBXML6yeKt4QsLSRixE/haQiCRg==
X-Google-Smtp-Source: APXvYqwNxySsORXLG+esDkvK7Ii1wSuVfuDQSq5KCSQrWhptWWlqsG/OvaapsdhkzvOJi9Kcgnn8JhM/U6rYqPwJCiI=
X-Received: by 2002:a92:498b:: with SMTP id k11mr17921992ilg.221.1576610930845; 
 Tue, 17 Dec 2019 11:28:50 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Q+ZE00XWe2=VohrYvLHWv96HX+VR-CFp_os3X4BoPEXg@mail.gmail.com>
 <20191217160440.GC1458792@onega.vda.li>
 <20191217161644.GD1458792@onega.vda.li>
In-Reply-To: <20191217161644.GD1458792@onega.vda.li>
Date: Tue, 17 Dec 2019 22:28:40 +0300
Message-ID: <CAFJ-+QucfFCP9Zaxta1h0Lwmd-Bb_RyGa-DFJbbQ5uKYV2FdWQ@mail.gmail.com>
Subject: Re: ldb: LANG=tr_TR.UTF-8 make test - fails
To: Alexander Bokovoy <ab@samba.org>
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
From: Caglar Ulkuderner via samba-technical <samba-technical@lists.samba.org>
Reply-To: Caglar Ulkuderner <caglar@ulkuderner.net>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Alexander, Isaac,

Alexander pointed correct problem. Comparison is a big problem for i
dotless and I abovedot.

So it causes problem on comparisons. I was plan to work on patch for
winbind.

I can able to help for this patch and tests.

Caglar

On 17 Dec 2019 Tue at 19:16 Alexander Bokovoy via samba-technical <
samba-technical@lists.samba.org> wrote:

> On ti, 17 joulu 2019, Alexander Bokovoy via samba-technical wrote:
> > On ti, 17 joulu 2019, Isaac Boukris via samba-technical wrote:
> > > Hi,
> > >
> > > I'm looking into this bug, which I can reproduce on master:
> > > https://bugzilla.redhat.com/show_bug.cgi?id=1743531
> > >
> > > In short it looks like running the ldb tests with tr_TR.UTF-8 locale
> causes
> > > this failure:
> > >
> > > Running Python test with /usr/bin/python3: tests/python/index.py
> > > ...F...FF...F......F...FF...F....
> > > ======================================================================
> > > FAIL: test_delete_index_multi_valued_truncated_keys
> > > (__main__.MaxIndexKeyLengthTests)
> > > ----------------------------------------------------------------------
> > > Traceback (most recent call last):
> > >   File "tests/python/index.py", line 999, in
> > > test_delete_index_multi_valued_truncated_keys
> > >     b"0123456789abcde1" + b"0123456789abcde1")
> > >   File "tests/python/index.py", line 98, in checkGuids
> > >     self.assertEqual(len(res), 1)
> > > AssertionError: 0 != 1
> > >
> > > Does anyone have a clue how to look further or how the locale impacts
> > > here ?
> >
> > Most likely it is GUID versus Guid in Turkish locale:
> >
> > $ for i in tr_TR en_US ru_RU ; do LC_CTYPE=$i.UTF-8 ~/tmp/strncasecmp
> Guid GUID ; done
> > tr_TR.UTF-8: Guid ? GUID = 32
> > en_US.UTF-8: Guid ? GUID = 0
> > ru_RU.UTF-8: Guid ? GUID = 0
>
> Forgot to add: https://en.wikipedia.org/wiki/Dotted_and_dotless_I
>
> There are at least two locales (tr_TR and az_AZ) in glibc have dotless i
> transformation different from Latin scripts and GUID versus Guid
> comparison would be different there (attribute name would not match in
> the test).
>
>
> --
> / Alexander Bokovoy
>
>
