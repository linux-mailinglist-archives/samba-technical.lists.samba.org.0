Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B82E5122FF7
	for <lists+samba-technical@lfdr.de>; Tue, 17 Dec 2019 16:17:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=q4p04erwqpuZWenojyAqJZklw6w4fX5k6o+DZyHaSrM=; b=z+tmprCtyoS8P6puNMdKciibNr
	VhDwzvL5xNKuSyrMV0jmvudGiPaonqMskUDwkNT+TAPiG8S9Qy5uiEFX1Ox8TzehzLnYekKYHNbXe
	ZDvAHC35l1HQU7+L07olrADEu4LCj8jhCVk2u03RGWgA9Pl4pZi4UkpXygUfSsGOe51x0lKkxtTjv
	BJ7IDKBd+8hKY971u9QdjsWukJSCeKbqUf33SN0aToHCet6g7vroJV5VgVBsY6atgjSitRxHSa3xH
	tDa+9ga/JcEOcYkkLneGmk6vn0xmbjsxifyVD1FR0BpfOP/imkgJMfOF3Bcdhk4WTumceAo9LIDeY
	fthxaovw==;
Received: from localhost ([::1]:55000 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ihEaq-007VnS-AR; Tue, 17 Dec 2019 15:17:00 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:41888) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ihEal-007VnL-9K
 for samba-technical@lists.samba.org; Tue, 17 Dec 2019 15:16:58 +0000
Received: by mail-lj1-x230.google.com with SMTP id h23so11346701ljc.8
 for <samba-technical@lists.samba.org>; Tue, 17 Dec 2019 07:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=q4p04erwqpuZWenojyAqJZklw6w4fX5k6o+DZyHaSrM=;
 b=JOYM6O+PHnXI56EhQ/DpKOGSPOBcIiy8FxaJVXl35EMwPL2Yx4B/zr5p2wyYEQ0fni
 rGmISj+pGlUpaiwCgCDY5nLwEYYX54iIWJfRI5iYIb7w/+54J5XWFc24QlSJE7QzEAwH
 nOfBgucH1Jg4WpqR6Fuu2EAvW+1hAXv8swv1FwcjPMbFIrQO0FaXGRezI720kkBdbFQp
 YiCOq2U2VF9HoksdUTKYi98CiTHM7Uyh08qANr8af/SsADbSuSS+LHmGLADCgHmBhXLK
 RVxMZc/5daObubxOiRLYai2RXz52RVE2ovohmAQzeKDuxthiUgyTRXtjjLAe4Vj7Ds56
 lhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=q4p04erwqpuZWenojyAqJZklw6w4fX5k6o+DZyHaSrM=;
 b=fSbmEHYsvsriH2U/8wZmM6QJwNi+EHwnpWBDinAkabW+Dd6COJPRO377ZBKsjGB+G/
 iRT5x6kwNgJ2OUCE6AvA/zYF8aWyQqZIQt2CoHCw3JnE3yH4ztuMMng+EwqhoxEzXvIZ
 b4XUYk3Ft8FyR6e6nLWVDE/2X6EItBq43Zmug9x2xa7oFLXuQ8D2sBVZ0g03kdMunA+G
 z0OD693vWi1pQiJBgIoSLMYesUr6Wacp1+8v/xbd0tUnzQdmz6dlzpTO4KBS8cRtGDB7
 rdVmKRBG22YWsqH52tfg/Q65l4hWmnGiV6eB5tzeTpI7ma6WkjMNzm5krL560QTJCXe1
 Ro+Q==
X-Gm-Message-State: APjAAAXnU+q3U0AzTclDxxkgdQFIbxC3aED2uEkXUGNAUAlH8OX1/iau
 6BOC2LiwyeOrqN/jVsOkaWhDUm6gubd2/iqGV/D9K3RUsy8=
X-Google-Smtp-Source: APXvYqzTMXPy5beEMsApSPGBi1nCtR16OB+tc8SFIX8jbhk1kazYaGtGjFXrxYFyGe6i9Yjm3qV0ExYwtpqM3n02m38=
X-Received: by 2002:a2e:9a93:: with SMTP id p19mr3623143lji.158.1576595813750; 
 Tue, 17 Dec 2019 07:16:53 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 17 Dec 2019 16:16:42 +0100
Message-ID: <CAC-fF8Q+ZE00XWe2=VohrYvLHWv96HX+VR-CFp_os3X4BoPEXg@mail.gmail.com>
Subject: ldb: LANG=tr_TR.UTF-8 make test - fails
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I'm looking into this bug, which I can reproduce on master:
https://bugzilla.redhat.com/show_bug.cgi?id=1743531

In short it looks like running the ldb tests with tr_TR.UTF-8 locale causes
this failure:

Running Python test with /usr/bin/python3: tests/python/index.py
...F...FF...F......F...FF...F....
======================================================================
FAIL: test_delete_index_multi_valued_truncated_keys
(__main__.MaxIndexKeyLengthTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "tests/python/index.py", line 999, in
test_delete_index_multi_valued_truncated_keys
    b"0123456789abcde1" + b"0123456789abcde1")
  File "tests/python/index.py", line 98, in checkGuids
    self.assertEqual(len(res), 1)
AssertionError: 0 != 1

Does anyone have a clue how to look further or how the locale impacts
here ?

Thanks!

