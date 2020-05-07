Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E97671C995F
	for <lists+samba-technical@lfdr.de>; Thu,  7 May 2020 20:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=BfmqU8wu63xByIsAQ4VLV1Y/gPRmzlyMFF2L0857TOs=; b=UDBA0ZaEzwAsVpPqSO4waUWB+a
	enV2JrF7xCFNWfv5kIxntc0Vvx5BdUHQhL6cpHYhMqhppcaGuX8BPGP9ecH1eP3t9AosQ7g37DsJx
	OzEw/H3hrE7jfhvYPZ5NCO6xniHLhc6ND3pkFqDiAlmK0UcK37aCGiheYeP4EciTPbabsEQwDbY+M
	mdLZhOITVP+m+2PDfIBnmlZp258YPoGdqj/v5WXo9gAaWwojPbBKzxGrgsmBenrmfd6MqMpw+YAum
	nx4XbVoxC9Z9kq02RD40j4kVaPNVY0Jbm1Z+AQvVMRAkbbMtx6FDX3zAxm890+CxiUfvCCvO7NpEq
	fZ0+Fybg==;
Received: from localhost ([::1]:40792 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWlL7-003ADB-Ic; Thu, 07 May 2020 18:33:45 +0000
Received: from youngberry.canonical.com ([91.189.89.112]:55667) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jWlL1-003AD2-0Y
 for samba-technical@lists.samba.org; Thu, 07 May 2020 18:33:41 +0000
Received: from mail-oo1-f69.google.com ([209.85.161.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <andreas.hasenack@canonical.com>) id 1jWl4m-0007tD-9Z
 for samba-technical@lists.samba.org; Thu, 07 May 2020 18:16:52 +0000
Received: by mail-oo1-f69.google.com with SMTP id 7so4156564ooi.20
 for <samba-technical@lists.samba.org>; Thu, 07 May 2020 11:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BfmqU8wu63xByIsAQ4VLV1Y/gPRmzlyMFF2L0857TOs=;
 b=QjVRn9h23hvE/oP7IDSC/NO/lRYb7jb/DsTuTI5UCNrVGN8TmNwH6NkHVXLyGjAlI8
 OfVPNeKaRA41SyrFMMhtpDB9h41ItJLLja+ApFcnO1bt5AwWyoQbLEgX7uAQsQn0lLep
 XYSrchGfGpCjY0RWNzedNfxsJ8ghPTVCdklld8HlWGtEdFBKMvwtyZJ9ftgySQuoEk5/
 zsh5egdvmJ5U8iQ20n9QCG7oDief0Hiq1tgMxwrMRcTZb7mE4Y0oI0msHw2oFQ5clWcO
 vUJmFLAWsqpIhxJpIklMewYnhxl3eqNOrOXpxCKwFmNSYdFfdl6gZVvcv0b5vPE25xpa
 3e/A==
X-Gm-Message-State: AGi0PuYVzyNx13ZyjSoWXJwTDwFz4KyrRjOCMauc/NC7D9lW9fJZiZP+
 LEOCSi35d+KZUggnRsa8QamnBeATZhyIraMvhqm5nephvR+U71kp2eSBeq+cHWLRfjgzclw4ewc
 j9pTlKe9txtlAhWfSeyp4yjiBsfUHVvWHdkGNBkFTAyCbNGReHezW9Yhd9wP17g==
X-Received: by 2002:a54:488a:: with SMTP id r10mr7427159oic.4.1588875411066;
 Thu, 07 May 2020 11:16:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypJQIFrk1rBPEcDeHuoI/PSFFbWNrR8pfvJAMowERb3Q2T8hVgVwZtMziILoZlkkE2puHe3N7g1UF+hOhLDo7g0=
X-Received: by 2002:a54:488a:: with SMTP id r10mr7427132oic.4.1588875410638;
 Thu, 07 May 2020 11:16:50 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 7 May 2020 15:16:39 -0300
Message-ID: <CANYNYEHEeDcD+5GL+wCotQG9O1XA1F_i_XmRwcGWbqj15PKxjw@mail.gmail.com>
Subject: ldb 2.1.2: test_get_size failure on ppc64el
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Andreas Hasenack via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Hasenack <andreas@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I'm building ldb 2.1.2 on ubuntu groovy 20.10, along with all the
other dependencies for samba 4.12.2, and I'm getting this test error
on ppc64el only:

[ RUN      ] test_get_size
[  ERROR   ] --- 13369 is not within the range 2500-5000
[   LINE   ] --- ../../tests/ldb_kv_ops_test.c:1721: error: Failure!
[  FAILED  ] test_get_size
[==========] 13 test(s) run.
[  PASSED  ] 12 test(s).
[  FAILED  ] 1 test(s), listed below:
[  FAILED  ] test_get_size

That assert use to be

assert_true( size > 2500);

but was changed to

assert_in_range(size, 2500, 5000);

in commit

commit e464e40c977cd6592240763c7dbb9c45ff16470f
Author: Andreas Schneider <asn@samba.org>
Date:   Thu Dec 5 17:14:31 2019 +0100

    ldb:tests: Use assert_in_range() in test_get_size()

    Signed-off-by: Andreas Schneider <asn@samba.org>
    Reviewed-by: Gary Lockyer <gary@samba.org>


Is that 5000 ceiling limit just a guess, or is this failure indicating
a real bug somewhere? The value 13369 I got on ppc64el seems a bit
excessive. On amd64, size is 2572, so it falls within that range.

