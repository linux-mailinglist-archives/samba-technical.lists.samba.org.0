Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EB97FDA51
	for <lists+samba-technical@lfdr.de>; Wed, 29 Nov 2023 15:49:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=j/AiTjF7rMKT326H2sk6g9JnflzyO7n0nSO6HECl0Go=; b=MNCMdoVEQi5AKjakJpcHaxO71X
	5fPkNYQxKwm+4UAE1Zr/7J5EexwqJ6K9lmaNv6kJm4xjUuNimnA3l0oDx7+drr7Sxe2ifwvCZNHnk
	LEDWXfO7y5MtqRybvKLZDhiMvLLIHd1R6EomS4yYTK5Kkuc0ryWmOkZk0MbqWVArT9CzINYUQJ/3F
	2l5I4+Taz9MagaqpF2xnzIB5AwE9v+cpZu/KjoA9FYunwEk9YL9uTOef+tbBWLyD6oVtUtJlXOKWL
	95BqNUp6i4qnP2480iTdH/3HlvBRyDdQ284oIgK/aTH+xiAnBPgHKq4hoavlbFprNIXzL77rWJZUm
	a0T5S7Tw==;
Received: from ip6-localhost ([::1]:36228 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r8Ls9-001O7W-5T; Wed, 29 Nov 2023 14:49:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60836) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r8Ls4-001O6E-Ip
 for samba-technical@lists.samba.org; Wed, 29 Nov 2023 14:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=j/AiTjF7rMKT326H2sk6g9JnflzyO7n0nSO6HECl0Go=; b=czayZNyTynZNP8yfSRdXedlg6+
 3gnBDe/2cTWaOLAsrzIOjnMVcmtpQ1P9KIZ43V2ulQi/QrTDTPDAkBzvqky2jPf0+iVti1lSTKnyI
 1pbFBFb9zVwMxonqkOwnPtlR8pT0KnrvIeEglIY3Fwx6vN3OtpQ+gwV5tgI/kYDdiHnEA50+NuAqV
 PxQsMWMXPxbJslEZzdi9HfrCdaCR9LbhZutqS/3qcF1ByDfqSVmZYCktoWQIFHTyER16IFB4pf7PU
 9UVbUaux11o56RcyUPkmRamnqtDUA07uKxJeYut1kheuGWKOaDk+Kd+mwxonuUaetzdTwjDwGjqI5
 cQRj572721p8d2PoY9ZVeiZ0eZSvIk6+exZXSiNhNKk4WOmuw1IMeRT3qnkljy3rz0vrhpyQ43GXO
 p/+XmKJE0D31lu6ZRgkARxuN4pVswCztfkXbdOLhv0Op4MbubmtTkiWi8KRVd8swhOfKGkncOKwr6
 eu3LP1hy5WZqzJ/EGkWDl1na;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r8Ls3-0016rN-38 for samba-technical@lists.samba.org;
 Wed, 29 Nov 2023 14:49:00 +0000
Message-ID: <52b4f09c-2de2-43ef-ad70-e46c73c2cc5b@samba.org>
Date: Wed, 29 Nov 2023 15:48:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.18] Samba 4.18.10
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.18.10 is scheduled for Wednesday, January 31 2024.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


