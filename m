Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EC555BEF3
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jun 2022 09:03:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=RQXVZGjxlDtiNDtMVRyuT/DP/9292E04FJrqaqvSk3w=; b=rqOuxr/+nLdoEG4WkOcJKUCwJY
	1EBYtOMkmqo2ovTNe6zCqc4sqgdxUHQjnoWW+R2+cos3hCq+FiliaxMPh5y3lCWZ6s9I5YmMg902O
	7QeJvYnjVT/IomPU4QFeHOEK9xMo8DheWA6++5a7iaGkOPcBJHepa/6xNEKkZD4531V6yk5yQW0kp
	ZlACzpdkBpmOPSj4XXJeWQrjnTrP+ByWYyTWwAccZkqHkt+6Ij2FLbQm7ItznN0dNVSt4ulEjAKwW
	MjdhTy2lKc6N4o0AhuJ1Df5LXIw6hzEn3czzzZG3bcR3PhfIYhgNSskr3Vv3qvYnPnfmjLtz7HseS
	Ee9PSENQ==;
Received: from ip6-localhost ([::1]:28988 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o65Fk-00D7nE-NX; Tue, 28 Jun 2022 07:03:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41522) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o65FX-00D7hG-5B
 for samba-technical@lists.samba.org; Tue, 28 Jun 2022 07:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=6fT4oCB74l/Ziu6kxjTPQmQtORX7XkRshGWG9nw+48M=; b=t09sxI9R/WEjkVsyH3pEXeUs1D
 ao0Vp+sEFNXmk/1qYYybR2pgi18d8h/KLLmq59pXhfNHHWKSMUbZGDahcO4QUj7RGnNWE0Tpiwyvm
 MDyB8xrK5/Mt5jbyqw7FdWpFb88GyD44IgwwuRVK4rCnuwQsfstQ9c1b/L5AnMMhqfzwhm7v3aQ0u
 ePkWTqMDn+TDVXYsKwbs96LpCtt3SCrurFw60cEf53ACh/h9lBthK1AmbzLmwwaVHg/ECLqoL1wZ4
 OoFd93B+R+Xo9MpT6WFl1tA/FlYAwJpDBeeJSgsWwp4gG0tAX1q+yLRRUcexpSlAoukk6xUK8t85f
 NaRMU9U3J28OMLMUCyFfRjAtSvItfyGNMG53296FZj+6rHbP5CpzcFLjImfLzUVvC/r0OBjw3nykB
 +lkWgqtySvcEMYtcF5pwROl68WnvCDee2kT3G4BX3OwzW+M38FfSM54Z7EuZiM+QGmXfehaMWzuQk
 kICVp+FRWapl5yjILVN/kkEf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1o65FV-0024XT-OV
 for samba-technical@lists.samba.org; Tue, 28 Jun 2022 07:03:01 +0000
Message-ID: <baf17649-2a59-e136-e398-30434f7f6e47@samba.org>
Date: Tue, 28 Jun 2022 09:03:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.15] Samba 4.15.9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.15.9 is scheduled for Tuesday, August 30 2022.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
