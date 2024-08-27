Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 75458960BFC
	for <lists+samba-technical@lfdr.de>; Tue, 27 Aug 2024 15:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=GRFC4qU+WBTtzC9nsHlZCN3XrfMzadkfYtW5Tdfbndw=; b=i/AR4vv32C3onmmgkkDijY2aXb
	k4cBB6nZYTMGN5AeIGNdL/j4M5wP8W1wweOnNBCv826EWSDIR/Ev2kKZrysTmGCj6wAaLi/jLl/xo
	RLoU4eQf8Iw4nLNf4WQlgG3z0YSpUMrOHkGmG67O0gL4TcV6obmuuYGvh1EaTtKNQ5RNB9LfzPXnL
	W6xTk4/Q2WUL/r0JpIS6ELMv1UM+oQ+W3MoHEvE3UIcPa05MDozT7Zs1itzZJYfw5jRJQNX1TgGtX
	H1kIocBGgSO8XzOC9R9yVsFShlQceEN8LNWxVboDlsfsiy4ppu1AhJpPf04J8L8d/iorVA4CIxeq0
	fBOHi7Tg==;
Received: from ip6-localhost ([::1]:58482 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1siwED-005bMG-IZ; Tue, 27 Aug 2024 13:27:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23432) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1siwDu-005bL2-19
 for samba-technical@lists.samba.org; Tue, 27 Aug 2024 13:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=GRFC4qU+WBTtzC9nsHlZCN3XrfMzadkfYtW5Tdfbndw=; b=pEMocEZqMeq7kjlGRkH3RQ9jpj
 mknOKBWdi+4oShTrtEhC2M5i0hSt7YinF7OYg4ssohej/wtTU4qfNs9Gq3pgJhKFbxFpZXFkYIv9h
 Rl9pltuEeu9kAcXHDzvLZDrQFvfYI7K3C67nhmCVbCazvUfPj4ntbSczcwXRR6bijJox6QowUdU+Z
 IoOQsK++VdDjEpg0BbRiBFLZReMB2aXy5yINvcNr277txuzE4F2h4nK4T+x44y/5gkydmSe9GNqrw
 8M2oDpAqUtuwn8DHELyIxnAfgqROUfqf5+digYQNKfNWJUjEu/TweF1VwJA0DtDXf0U3wA6rmOyUw
 96YsJeeehu5qEf1Dhm5Rq6yMzqe02VZRVjjXKdzlEHpohdWEHnD8/CnoPFJ11+kVxyMQ0vSMHqsMu
 bbGU/R1U58ELYAy1u2iKZtWWEVl4Uz0DSKIX/bRoNmR1kU7uTujyAUruicvubxJ+SBdUWhhPHJlEk
 i9a/5dS1KaeRpOZJW62EE3k2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1siwDt-008aTK-03 for samba-technical@lists.samba.org;
 Tue, 27 Aug 2024 13:27:01 +0000
Message-ID: <2c05c429-acc3-4063-8874-11a27a1fe27d@samba.org>
Date: Tue, 27 Aug 2024 15:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.21] Samba 4.21.0
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

Samba 4.21.0 is scheduled for Monday, September 2 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.21
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


