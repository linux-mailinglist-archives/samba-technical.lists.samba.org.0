Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A0B4B99AB
	for <lists+samba-technical@lfdr.de>; Thu, 17 Feb 2022 08:13:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=95sdBplEBJyFIuRcAq6GxJX3saxUgANGopEKvMs8hF0=; b=OJwsE7n8HBcKnxKevocUMW25iA
	IGo+mJvL2xi4eF6VVjKxhRL3jyDi/SO6hfgfFYAh0zhdFLKAD21Ha4VpP84VEQBw1Z4I913G/dUPd
	hchkaXeKMJvJBOiG25sFsQ7byP9LbDoOwectZ2asQR271mwLWps5GtDx8mCwSOUie7UCHNdc9Hwif
	Ril9fRxQFoUWXE9x5lU3JpFVSonsU+sp+R80SDQf2Z25HJ/qx6hWWL24Ejf1T84EeFpicOifCDRGG
	d74CErM0jtVCN2F12ek629hzLDmIxdwsLl9d4NJ+Pkud/JnwD4nlXQWFXFNHOKKI/9FtCorZlVxxk
	5/sfYxHQ==;
Received: from ip6-localhost ([::1]:31116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nKaxc-009HlN-Gi; Thu, 17 Feb 2022 07:12:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49060) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nKaxR-009HlE-0B
 for samba-technical@lists.samba.org; Thu, 17 Feb 2022 07:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=95sdBplEBJyFIuRcAq6GxJX3saxUgANGopEKvMs8hF0=; b=QoUwX954IoNkBbg1zuUpm7C21l
 uYHODx2LqI2gpEIKrDJjNVu4hGo/pYR/ub8PeB35ZWpdtxAU/r8HhsJTSe1PEBXIH9GERRnl/SKMG
 KgO6QACTd/cQKGko0vIQQ1+sIrSh6tCrTNpSo4QO3wIK6qv/xhARc8GYxRbL4KMBulcfCEZNbA5fV
 OWnMAdOrm2KIxhKKDjxaMWYjH6cjxy1f47hjJPDHOfT/3MPR6xMtGsfNcnY7jFeM5jgH81vZlMaEW
 SGxQlykcFzszocoo/nFv1KMlMkujg1YVkdL4/Np5OqxD9x8niwZ27JBlc6j9WJ2+QDHp8xEkbABKX
 XAQamSQGhE7K729wOuDKmD3RSQCVc9wVP57o+xN5my4cRnM9keflX9wmdVPuLD8ppo03DSWCOvUdo
 jwpJrAswJ52ywv/+0vytZXOOXgTmIQbkatTk4OhcGKbflDNVzbjxIYZtxDoYn6+uiLxS1Z8gk9n7C
 AaBh0gJRX+LWUw3ZQmz5moF7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nKaxP-004Bgc-5b
 for samba-technical@lists.samba.org; Thu, 17 Feb 2022 07:12:03 +0000
Message-ID: <a467b8c518ba15d75ab04b61d8390bce27c19608.camel@samba.org>
Subject: Getting back into reviews soon
To: samba-technical@lists.samba.org
Date: Thu, 17 Feb 2022 20:12:00 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I've got out of the habit of trawling GitLab for reviews, but fear not
I am still working actively on Samba (stuck in LM removal right now, it
is harder than it looked!) and hope to get some reviews, particular of
the various KDC and DSDB related patches shortly.

Sorry for the service outage,

Andrew
-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


