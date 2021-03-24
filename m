Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E972F347D54
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 17:11:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=oHjg4yLecuZqCRHfQ/oR25jRv6DwKJa1IC25HaheOIk=; b=5LQxqXQsLqh9ITGDtT5yXCDlmD
	cDUrsnKcy9tTjJSnMmUoZXrtKPHZ985UNcL3sYOKrkdKV4owbB1jsnviR5a1u7MKkaEjjbYhZ34Qj
	0ZLtplZRMUXkt2ZUQ9x5q1UW7/mGLNC0a/deQ0rmL0cEZDXuGpNv5kGirtyOGJEHSgsvoA9UHhO0J
	TJUfT9vJxeTnpB/gxLNPhW5/crogtZZ4fKcuN+z9VnU1wqWOiIcDUvarwd/C/EhbqozV4CddQf4SI
	8qgHW5FRzHIviG22hotu4ADxzFPa982yFLGfDI3rGp1HJOOOymvUBtlfnrfWyLqDwsMnHn6AVlZDb
	rABRNvGw==;
Received: from ip6-localhost ([::1]:35760 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lP65R-006byN-NQ; Wed, 24 Mar 2021 16:10:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59418) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP65J-006byG-3x
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 16:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=oHjg4yLecuZqCRHfQ/oR25jRv6DwKJa1IC25HaheOIk=; b=bh90ECucUHTThEv4vIOR9um05A
 b6eZT5jDmkGFlgULebyhOXT/Z4Dzdg9f3U0fC8ZCk3uQakcApJoQAVmBaWYC0HFMx9gJWfL40pvAW
 sHUoJ5VdBTKUBHWF1hPqjlS3PbETy/lRqUeJO5rEn7i8EMI4tQdaJuavhuXa7wAxy9QR7egiusPEN
 aQJ2vsEsM4Dzssibx4cBuy7Lc6S/zDgU+ZV16KnZPzVUEJ3lOt9edPqPTuP4WzRzQCwdd7TOq5Tc+
 BLAqE1wWbhMt+KQAQb3wA3VpDHDZuasYimpD71e2XnA7i4kHioTl4BhSkiU5RyHZIePACOGMjMqX2
 1BNL/Jfwr5fX/fdHAPP/Zfui5Kcpe8DythFd+4S9idt1W4+rWUS9HcyCeSWSqJxGwkfxmLw0voV+Y
 zm8fFsSvJnmA+t5EGDfdRq1l34yZhSco8Do0Aqw4weymnCB5wv0U4XUDckNR8bGE6CfzTjeci1r8g
 e8ubwvGiiiDpqZb/uUlesIJC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP65I-00066o-9E
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 16:10:16 +0000
To: samba-technical@lists.samba.org
Subject: Drop NIS support
Date: Wed, 24 Mar 2021 17:10:15 +0100
Message-ID: <4045140.l1vqqZ3lm0@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

could we drop NIS support for Samba 4.15?

This means getting rid of lib/replace/system/nis.h and yp_*() ...


Best regards


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



