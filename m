Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 221CF19B479
	for <lists+samba-technical@lfdr.de>; Wed,  1 Apr 2020 19:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=nkbLhIz364nt30j7bpeDHVb/Rq4xXCcGwpMUpijohjk=; b=0aR7V9pr3lNt7vo64vBU/PGuo8
	ypHA9qrb1//h9gDBDQvZrDpJckfablMp6bnxf8qpvEv3f03bZvOD1hxxpitPjeVcVFR/7lXdjPFTT
	yKcKnUch5dbDpWSEdnOG+QvNQ+30+K1aDAjpo0Kj74zrI7KRzU/TTycCBeIEAPbq/8WkZK75FWA1p
	FAsaMWoGhcnzc/dKFszN8nRDT8GgOxWBhkGDVOnNOOOvlSw6rCodB80snWTkuOgcWZ5mdfePEbt4k
	vBT8EP22oKRXmVdYtg+N8zeQeDFT/fL/650orXCQ3j03HFDyz8iTRF2b1sFcZFt4M8s8Y5Lu68FJo
	Zddqpv2A==;
Received: from localhost ([::1]:40430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJgkA-0031aT-AG; Wed, 01 Apr 2020 17:01:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53560) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJgk5-0031aM-7m
 for samba-technical@lists.samba.org; Wed, 01 Apr 2020 17:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=nkbLhIz364nt30j7bpeDHVb/Rq4xXCcGwpMUpijohjk=; b=S7z0+ro2Y0IlHmsi88au4L72Uk
 k5AE5bgT3DEoxB7z0akBOJ3zeVDNLJNABU37Wod4ysDnKPYfvGGOjnVX/QKa4SoTFNU8Dc+W+nBMH
 m/TR+ak5GusAW3v1VwF7Fn4bLVOKLdqKHo8GZA3mSMaL1ZzDJYhxsEb1PRBMGowDMkm3Uv5oGwor+
 QRdnBQv47o1FNyC+nMKb3NZQcR/XR2Qd1iyRvLD+mYeU90wGpNw9vyGsxe7AjhKS5KNVTTh9kf8B1
 2IWsY1jZb8VSmMlIDPN4d2Yu8bHRbzusUyDM0MRFALEadYwkuiNW6V5VvZ5hQEf4wf6/wYt4LjTuc
 +8xTbyYukwQ/EygnbPpBAtGJgzuu+2jjbadYTC1KtqE5HWYEipw8CaG0qSXbbwb5Z6PN+Q5ItBQoN
 Ip1TLSNhMskrARF9rXOBzSB/u+LydNtOJsw4wlEBpESFZpqFMI2tvVW6FN19K/sgfZ5YEoLBEH8rG
 jE/4LeP4huXWztSBfM3T46bp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJgk3-0000jw-Ty
 for samba-technical@lists.samba.org; Wed, 01 Apr 2020 17:01:28 +0000
To: samba-technical@lists.samba.org
Subject: A pam_wrapper success story
Date: Wed, 01 Apr 2020 19:01:27 +0200
Message-ID: <7821886.Ryaapmv3DJ@magrathea>
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

Bastien started to use pam_wrapper for the PAM fingerprint module and 
contributed code to cwrap!

https://www.hadess.net/2020/04/pam-testing-using-pamwrapper-and.html

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



