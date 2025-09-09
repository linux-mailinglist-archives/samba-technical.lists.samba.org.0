Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F29CFB501F3
	for <lists+samba-technical@lfdr.de>; Tue,  9 Sep 2025 17:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=yewOnSSxp4AXlhDujmnPNAsGF2+OJvdLQrNzZ1YdXv4=; b=ZqoIE9Ab2P2+N9eZ/2imWUWA4O
	vrQDjiryoxAIHQt0Q7/MKFQZJFuGd/9w0TPl+ZJgdulq9L2viBYKci1iVrEcRJWszwVfv3K46Jmvu
	6FWfsZY8cgEQmxXDG+bybs7s64aNy9ScxZfiuH+26HakCIVXzAGYGb2uBQlbEcJ3qZhDEk0CALWlN
	Rd6Y9tSnhxaQbz0foRaxQ2rr+mh174C8HRDUs4g4BA3qhe3W2XDKyYWbWFElF+nK1GV5bsnc3wzhZ
	K5qdUrmyDs/CUJ94NVyuRmqSCl2WkVJLM0iavPm4w3nHlHRskl/By1qrYzFRmzxNW+wj2rmzfKc7v
	rPUnNnbQ==;
Received: from ip6-localhost ([::1]:51294 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uw0gb-003OGO-OS; Tue, 09 Sep 2025 15:55:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24892) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uw0gO-003OFZ-A4
 for samba-technical@lists.samba.org; Tue, 09 Sep 2025 15:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=yewOnSSxp4AXlhDujmnPNAsGF2+OJvdLQrNzZ1YdXv4=; b=2/CfvA5BlqTR0ZODu0seig+UDy
 GtTi9W3ZC2Vjm1NiGvVyvTtgZNCZGDp77KoQ6yzOvMAA9sx2BojivDb+VMpU0xLMxqGf51HeEAd0O
 BxKVDhGnnWhNG0kSI5bar9sfQaTKCOx3ZxNBJCzcUNGRNbIkWT1s5D4aE/HGDdGgOiQ/AYLDCOGC/
 0U0sbxcwe/AOLkrZROG1vMiBBT/XI5QQ5/W4sHy2W6yRyWQQQr5X1wsUsBEWm2TFKktEyZsugTtw7
 wGYIPO6XVyiQzqwPqdxJAnkePuMwtKykT9Te/P9Z4bRk7O7Z19KVBApCz2BtLd8Zxc6YUtrc1ds6P
 dc15xdftlwao/flEHOKxrrDBPkt8qfS76tZGlQ/9sCgrZb9Y8NftUt/4EVivyE0dYE0h2yjEGuBLM
 OvVx0XupbNbUxDv8sdxGtXSHUIdiDxDZ90/g8gBQcYZmOmRQdX+AWdUFpv2PM5pn6wUUmY0IXkJ8v
 S6i5vSnMWW1qHTEtuNgerhN6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uw0gN-003FRd-2p for samba-technical@lists.samba.org;
 Tue, 09 Sep 2025 15:55:00 +0000
Message-ID: <4660ec4e-8dc0-4e8b-b2e4-ce9288b7f2d9@samba.org>
Date: Tue, 9 Sep 2025 17:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.21] Samba 4.21.9
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


Samba 4.21.9 is scheduled for Tuesday, November 11 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.21
has been updated accordingly.



Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


