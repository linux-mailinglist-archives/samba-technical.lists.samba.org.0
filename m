Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4E85879B8
	for <lists+samba-technical@lfdr.de>; Tue,  2 Aug 2022 11:13:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=EN6SQS7XHTPY5l8BjE+ebca6Th8Rmjd16MZmsDwTL4A=; b=ndrJYMF4KOlUoll4P7IxZbHruf
	jejJPS6QgbxxDvrdxhrM8hpsmufnDEUnmluQM0A1kFZqVECPWPuoB/OMibriETUl1EQs3l8bEiVST
	WUPfy8Qjl5rUkIUsRd2GaAalB698/udtBHHI7aZw87NyWFdUNtcyer33EJrZG1WkNyOehtWhNedNj
	/DAfOZDpR9Gn0LZVRnzS6YOEi3tkaIeJoQ/4snm7Myn0sgp5E9R7cLe//iwbiuUWXkgMWfiXj0Pvk
	tPnFNvcRUOqzVXEIdotQb+RYkpQUSJEONNBy2nv+RV4F/hgH9FXEyB/+6xfRO+iA6bqk6Fn2Bs4kx
	m4+QgrBA==;
Received: from ip6-localhost ([::1]:38128 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oInxD-004wDg-Uu; Tue, 02 Aug 2022 09:12:44 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:33304) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oInx8-004wDX-7s
 for samba-technical@lists.samba.org; Tue, 02 Aug 2022 09:12:41 +0000
Received: by mail-qv1-xf33.google.com with SMTP id d1so8744670qvs.0
 for <samba-technical@lists.samba.org>; Tue, 02 Aug 2022 02:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Gq55LeAMHsc6ygpmStEtODdeqzGVDY+sFJ18Fvm1vRQ=;
 b=Fs9mIh438gBKGFg82tEUBaRvxiF295/7JBInsyUY2AYj1XAtEqxJaUc8ZDBa8jpNHM
 pvDrq19EuHZIHUxOOHNbXnNvEdnoUKLxS5mKiCgK82H7+C/KESbiRVJc6tsIYKfYyCy3
 vjkqKfICuXpjs1F3B9q/kukX7wuoy4IXpFoAUxRS/qOaCEfnj3KFke3pqga+XZ3lnAPf
 6uab4fmPUgSlKcJYabjTOD0cP/1YTdrUEk1X8Fvvoz5nEcxD42u1gF6htNcSvvGsIyds
 5qhkePds4ZfGp5RydSC9mTn801trF+3FejKssHpsLQpj0Xu6YnBNaY0yFuc95QClF1LK
 PByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Gq55LeAMHsc6ygpmStEtODdeqzGVDY+sFJ18Fvm1vRQ=;
 b=Z4lTNh2n6l8EdkS2o0RvtPrM27t8Wwv8uiYAdtQsyAveg6FxD/QZkF9YciXEd/qLAa
 MRpZfoBQN3ZQS72PMehB9Gnqh0GlhzAnVBFYsN5qdCsOOa8L2xGxD7GNB2wOHHSqG9tD
 EzuAzIfPsrxElmsnKlfmEgCkSeKKywikEnxX5vABgAwaKgUYSEi7zF1SW7Ct8vZJTR3d
 Vlr0Gfen42RYdH5ZRNjU21oqUGLYQPhfW3lBbivkwsl9eMSb6ODi7Kwy2fSYoFUtP+LP
 UosX3/yn19LQHq6b5fCrbTFT3Qu3TkDQsFEXABPkglfFhUe2dZwRedGoH7Xfswh9mT/Q
 JtMA==
X-Gm-Message-State: ACgBeo1WsgtHj99efndPd/2IEAINJFX2/4XZcAbMeUYhk8G3YSonubRX
 EhA6c+f+svdiVWtGbdfxA2/J5g98d5Uj8AnUJ0NxZQ==
X-Google-Smtp-Source: AA6agR7ekJVQv4qcWYpO0j8Zzj8/z0eWYZcSIKIsqZoU2wW9fVTQUolL3LB5b7y3I9KmQxBevg59+5WKpRz613hO5tM=
X-Received: by 2002:a05:6214:f6c:b0:476:6e82:7af4 with SMTP id
 iy12-20020a0562140f6c00b004766e827af4mr9747401qvb.129.1659431556067; Tue, 02
 Aug 2022 02:12:36 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 2 Aug 2022 21:12:25 +1200
Message-ID: <CAHA-KoMtF8x6mRHoyXuv4oeXo+1KKbVx=AVwgPO6YHsYvpW-EQ@mail.gmail.com>
Subject: Hung up on writing Unit tests for dynamic DNS update from different
 source addresses
To: "asn@samba.org" <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>, 
 Joseph Sutton <josephsutton@catalyst.net.nz>
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

Code as it is up in merge request:
https://gitlab.com/samba-team/samba/-/merge_requests/2271

It's come a long way.  Been cleaned up a lot, and just completing the test
suite.  Need to test
denying DNS update by IP source address, and updates authed by IP source
address.

Have managed to update dns_base.py to optionally bind to a source IP
address for a query, but can't figure how to
set SOCKET_WRAPPER_DEFAULT_IFACE for the test/special test suite process
socket wrapper stuff.  Tis getting quite seeing double inside
selftest/target/Samba4.pm and source4/selftest/tests.py....

Could some one please lay out a map for me how to proceed with this, or
just help me to give it this extra push with this to get this over the hump
and accepted for merging?

Thank you!

Matt Grant
