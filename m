Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8E33FF92B
	for <lists+samba-technical@lfdr.de>; Fri,  3 Sep 2021 05:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=B3j0AqvToxNc3J/JGswMzWNtr5VFncBejv057oqCNh8=; b=cdNqcMwtWhrhRD1LVTiy6nS7M2
	q5eKb6DnUkNkcy62PsDbWSup0cM6QrEF67Ocbw+E4rGaRBqoq9lpgDKkgdOWn3mh6QTaV7i+padwE
	+zPRibv/Z2KOJI8NGG0LLR+hkTyaSIC+u3EjwctPLE0rB2AIWkNKTsOyLCF3PutErsoTRzA1nTetV
	i8+Cx91W/0JBb+PirKHG5ejR0wzRYorD/jWJ4z+I2gHs27+FjAe932M7R/8RNF0SIDDBBG9UlqwMF
	UR3nFnb8KXVHxZnpTwTbOaf5fx+Ae1A23JMYdzHYY1FHVzdfGUp0y+iaiaIgdLFDWvsAdF+niQxnj
	0W7zEkTQ==;
Received: from ip6-localhost ([::1]:60218 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mM0Et-00Ct6b-Jv; Fri, 03 Sep 2021 03:51:39 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38563) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mM0Ek-00Ct6S-JY
 for samba-technical@lists.samba.org; Fri, 03 Sep 2021 03:51:36 +0000
Received: by mail-pf1-x42f.google.com with SMTP id s29so3298736pfw.5
 for <samba-technical@lists.samba.org>; Thu, 02 Sep 2021 20:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20150623.gappssmtp.com; s=20150623;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=skbiV60QtsguOEezPQD837Ywgnd9Km2foyknTHFwRew=;
 b=ALdzdYfTqN9f9KCGDWW+CwTvmthGQIRSXNO2EjozK7pX8x0uFBDWDSZo+mgXkpr9rR
 U/NiD2mavmWuZqea2OPnXtcuu1LRiaDk0X7qXvh/velUxtwPPy3y55ys4Dqb1QWWTR6N
 aTYEuAVBrQ80UlD8ePwSfSB22bULzMn7xt3kDZ0YDQrYzOQwdAPNxetQEE91JxGmmeye
 F3FJS6zdZLzGXsIFpeCE0U0OUSpwN6O/cWlOfZjSO0tow1cGlSRuJhBL9zhdp0Cd41/k
 B2L65pu0AtPwOWopA3Qc0gcIwZHpHSJif4R8SNsDon7vMHTsTVScjV4lPOThR/w7rmi1
 CZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=skbiV60QtsguOEezPQD837Ywgnd9Km2foyknTHFwRew=;
 b=qoIQIz0L6tcqTgJPg52V72vKdFGIHQbQp2yiWf6YjAfRgRst0snjLJdUEs3c3HALef
 KZg0SfAugAQKYEzI3aKECHI26a6QAcp2xGUtfh83B3c6CAJrMCCcN/WagOJV4LLRG6lq
 7UqikRTNCX9Ri3Z8e5gwfLaEr84EVMMx/tbr7lGv3qwVy/SzhuZZqOFQsfHpAjNqhSUG
 7WRFslesUKlYoiXqGAo4UGZJsNcJMppGiTIOoSNU9CIfKsi+xZBBdXmbgjyxjVJi2QUd
 ODlxNUmlXxk5aYD7R3bnJ3SPsn05FPugtC9Sl2MnQWuQLnzAd9qt8ZphUvsdENVJYihj
 h1NA==
X-Gm-Message-State: AOAM5304KfECkPRVIux8cSfn9zoy9BV7wOeklEcOf4Uj76DxzJqKwdfF
 oc1vy0Ew0VoctjeBAApa6q9zqJ7uPhZ/YA==
X-Google-Smtp-Source: ABdhPJzSeKRv8xJVNGNZw+TmP1qaoWodsZqzfaB6mh0sGBtoPEThxWt8L2K61mfzziN6z+qhYFE7lA==
X-Received: by 2002:a65:51c8:: with SMTP id i8mr1638299pgq.451.1630641087033; 
 Thu, 02 Sep 2021 20:51:27 -0700 (PDT)
Received: from ?IPv6:2407:7000:96b0:e500:e733:ba37:3588:8ee8?
 ([2407:7000:96b0:e500:e733:ba37:3588:8ee8])
 by smtp.gmail.com with ESMTPSA id a78sm3634169pfa.95.2021.09.02.20.51.25
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 20:51:26 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: New developer - CI build failure in /usr/include/gpg-error.h - can't
 read, not connected with patch at all!
Message-ID: <457c64e2-32b4-2de9-7c63-99583d679942@mattgrant.net.nz>
Date: Fri, 3 Sep 2021 15:51:21 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!


In Merge request 2146, CI pipeline #364432341,  had this unexplained
failure:

Processing file third_party/socket_wrapper/socket_wrapper.c
Processing file third_party/uid_wrapper/uid_wrapper.c
_*genhtml: ERROR: cannot read /usr/include/gpg-error.h*_
Processing file /usr/include/stdlib.h
Processing file /usr/include/netdb.h
Processing file /usr/include/pthread.h
Processing file /usr/include/grp.h
Processing file /usr/include/gpg-error.h
section_end:1630640126:step_script
[0Ksection_start:1630640126:cleanup_file_variables
[0K[0K[36;1mCleaning up file based variables[0;m[0;m
section_end:1630640126:cleanup_file_variables
[0K[31;1mERROR: Job failed: exit code 1[0;m

What gives please?  The patch for the dns forwarder port has nothing to
do with this header file, every thing compiles for me, and the
dns_forwarder tests run fine on my Dev environment.

Regards,


Matt Grant

