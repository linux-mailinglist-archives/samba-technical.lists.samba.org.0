Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75C103875
	for <lists+samba-technical@lfdr.de>; Wed, 20 Nov 2019 12:17:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=QzjoMsoZWX4+kZyzmWaWa5XpzUdYj/RBa/bMvkbvWGo=; b=RWwZcAsuzcNfwdudE2FtV4NiH6
	dUytncsnqDtzvLgXxcUz24G7c0HUALNd7w+MnJ5zRFYXUqTWIRWLvDc6zf6dKSOKbIxMCsda6cM/U
	Iaa3a5fMzOoemVAhxAxPySiCszjD1YfJVURJlZBCmqBL7I0QKmGEL+nAEFukoWwjmq10V+kyP6n1Y
	jbQQSyQ9evX8QAyejNdTMeIncn+CshzHqMX0QkatZbTa+i7ml4M4+hiT79s1s0nNAr5NBVLYPK3/p
	gKXiQ2C75QN93INb/di4zW7bkEwNxQentLktcTPJ+1Ht6fU+pGmdVOcLmJqX6llLxOr8s2/vnIzS0
	mwmZty6Q==;
Received: from localhost ([::1]:41580 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iXNyT-001ioE-CY; Wed, 20 Nov 2019 11:16:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19058) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXNyO-001io7-5Q
 for samba-technical@lists.samba.org; Wed, 20 Nov 2019 11:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=QzjoMsoZWX4+kZyzmWaWa5XpzUdYj/RBa/bMvkbvWGo=; b=U7er8yX1jeHOyQBR8PD7JcgDRg
 xSEr8Oel+4vOpO0sWB7QRfaeVCauudMBNhSLOAGL4a/wSvDBrcej72CkobiPjhm+0NxmP2juxVFNf
 QMMjAei1okkNGVpAyNenahuAmE0/Q1fhxRzoWSplGsMBkRHVOl1J0ZcGGsXtlDasTGA7y3PREYNAA
 4zkGLIAu/b996D5r/fScfQbl7tvUtiGsn/z4er0c50m/p+bOopLqCtMyDqyPBO/xEpAsqelMCOsdT
 zvjiR73UMb10FcMgF17k6U8cC5UWoiENmmVbbQ3UfGqv9lR3dyDPzsQUwDk7oL65gWE+RlMkgifOn
 HuoX1Xh1jEGtEflUrXaEVC/p3IschqNBt+p6lZimDGdsXMSuZ0SVeJiXAbVP6GdakNAmOA9gQ03RK
 celKB6+dF612wFt6T3/eKYzKsguxsfIb0myF0cy72GTkML8oXJjapM5sJn/WYqRHlTAsabnVjwF2P
 7tprL6mTq0Y0L8E+yB7vVLR1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXNyN-00078b-Nd
 for samba-technical@lists.samba.org; Wed, 20 Nov 2019 11:16:35 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.9] Another 4.9 bug fix release
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <b809fe9d-b399-c13a-bdc5-0680d140ca6e@samba.org>
Date: Wed, 20 Nov 2019 12:16:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

due to

Bug 14175 - Incoming queue can be orphaned causing communication breakdown

there will be an additional 4.9 bug fix release asap.

Are there any other important issues that should be addressed?

Thanks!

Cheers,
Karo

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

