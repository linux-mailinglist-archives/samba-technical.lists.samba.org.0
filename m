Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1747F14CEAC
	for <lists+samba-technical@lfdr.de>; Wed, 29 Jan 2020 17:48:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=IsMndgrtPxU0sCveei2An5lCDceS2AzPizBUF34dreE=; b=tDUApySVHTBy5rVXmHQ7REHHex
	bo7XbznP84o6NVG2x4+ZadvPwnb5PEY3+uc+8Ud7pJ4wtUCOMRO50rFx0LtsY558S1bmK3jDxK68P
	m1UEcnPDnaG4CuqcFmFjjzCeiSNdlPJiMKbUQ1vbyuRn9Vm3qejtFvQyogF+nGb52FXYW2oalNfW7
	nEhpVeOjH7juOXOAMiR7bC9h7ExVeLz7fj3JMyA7EISdqlT9oZz5HndHKY20PUDfUG3F50JcUCvOl
	WXCNKqwNbXwrlk77exQ1jGhmrFr2zIdkb40sXAn6L5RQ9iGEcRvE7hYx/lZm0bC+Fmk8H21JKw5ae
	gjCnNxYQ==;
Received: from localhost ([::1]:40052 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iwqVW-005Jv9-QG; Wed, 29 Jan 2020 16:48:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32628) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iwqVS-005Jv1-IF
 for samba-technical@lists.samba.org; Wed, 29 Jan 2020 16:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=IsMndgrtPxU0sCveei2An5lCDceS2AzPizBUF34dreE=; b=kxkbIXlcHQ0gI6f+NzKoq/GCsD
 52Vlir+yD7ytPIF2p1k8wNBsq0LSLHk6FVOAFx4u0uvcKwGne962IAHPzrYhjhx8qRmkYwJKZXxwB
 pUWfFXPmEuZJ90V3/nE+gqI+FZJAfvNN5WWwM1AfWtXShJlG0hTDuDxLrdJgRBQzR4A45TltVIa1C
 cDjhQu5W3oC6XH6J/5jGhVMb82dOy+9OewjPuqlRnAs0auGQdXBkMml8eFUp7HPm7+Oc06yG08i1A
 srx6nv5gAjupkZdvNNhEiXmlhryHd+/za6x7eup4ReDFHDIF0EV0pw34i/Jk0rbSEEng4OncClJ9t
 KF9Uk4EI8ndZSZhuCa4QD5Lvo42cMVg7P/zTsc7jBW12Z4irYTg5soq6haUDgUpr678Z13rpuuMop
 sks6DyZ0AcQBvKYtofMNfHfvudPA2kSk/sPP6N/RRboHkns0xRoQuUnCRqPyMSN6oVZKKwyH9qFnn
 /4dtGwiM8ll/5+SNieSlSm2a;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iwqVS-0007A6-8P
 for samba-technical@lists.samba.org; Wed, 29 Jan 2020 16:47:58 +0000
To: samba-technical@lists.samba.org
Subject: The samba3.base.delete test
Date: Wed, 29 Jan 2020 17:47:56 +0100
Message-ID: <1772232.gcRF95uoko@magrathea>
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

Hello Team!

The deltest20 of base.delete works if you run it as a user, but it fails if 
you run it as root!

Is this a bug or expected behavior?



	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



