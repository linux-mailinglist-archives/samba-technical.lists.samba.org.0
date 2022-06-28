Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 652A555C0EB
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jun 2022 14:24:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=YUs5vQ4eXbQ14LgAOLT7yihGr29i9rtxuRF4Imrg2C0=; b=QQhhZEGNgO7lZzDkn0MBi4Fl54
	eB7xV9Lf6c6OA+L4VpM/lVwQF6EnOHPczVuw9eRuEo0AyghyRTK+onAg7baeS9w/WnTkvZ4a5Pa9S
	EFOvznU+mCSPPdY6kTwPLjWxOGwhQVgFpNInW9Atc/+a6RJFjs3L/zOzLFKu1fqtOQsgoJJ6VIWMc
	3+Jd1gAzyX1afKItM6iLn9TGfTAX7mz52U32UYckTcoTnDmfPlhOXXFTt/oKSIGIGgJ0CewlQlNiC
	NLbL7dmxi8MzqS64piR4TPhuys2XlKbd8svJT5A0Fw3uh7LdJuaiC4pn7WXQOHh1jnAwLxSS1nDoF
	6nmm5VMA==;
Received: from ip6-localhost ([::1]:36228 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o6AG0-00DB2F-QH; Tue, 28 Jun 2022 12:23:52 +0000
Received: from grace.univie.ac.at ([2001:62a:4:25::25:115]:54572) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o6AFw-00DB26-JV
 for samba-technical@lists.samba.org; Tue, 28 Jun 2022 12:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=univie.ac.at; s=rev3; h=Content-Transfer-Encoding:Content-Type:Subject:From
 :To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=YUs5vQ4eXbQ14LgAOLT7yihGr29i9rtxuRF4Imrg2C0=; b=svp0+NOIQsd/drWY6H+bPJeWvH
 W8Rg5YRTQKNW5sVa1lOaHahlwo9059cNCueOmlhQm6tA0uQ5zb2JLrcIOOmfRl3cCOXWBcmtXX2ps
 e3YZTrKgXGUnfmyY4ZznNhtmtvp9vkMIbEokHflw/Mk91m5yCG2aTWzWfzNstKOts+Hu5PL3bUD9k
 FfQCPe1fo+23byeMSN0pAeQC/OlH3VawP52es/Npeg7hB8dK+1XJwwpHRG9PAQJJ0KDG8Co/vGkUx
 IgNk7JEnUt+YRQ86pb3FQs47klIhhw3aj2VKYtkPe7qN9ea7+4KFUL2QLCj/LDK6CD3R3oXAebRhT
 7f66/fjw==;
Received: from joan.univie.ac.at ([131.130.3.110] helo=joan.univie.ac.at)
 by grace.univie.ac.at with esmtps (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.95) (envelope-from <robert.weilharter@univie.ac.at>)
 id 1o6AFt-006jJg-N1 for samba-technical@lists.samba.org;
 Tue, 28 Jun 2022 14:23:45 +0200
Received: from robertw22.vpn.univie.ac.at ([2001:62a:4:32:131:130:222:140])
 by joan.univie.ac.at with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.96) (envelope-from <robert.weilharter@univie.ac.at>)
 id 1o6AFt-00AHMv-1q for samba-technical@lists.samba.org;
 Tue, 28 Jun 2022 14:23:45 +0200
Message-ID: <07c7040e-f4be-a6f1-5c50-80db9f39c101@univie.ac.at>
Date: Tue, 28 Jun 2022 14:23:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: Expand groups with Samba 4.15
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Univie-Virus-Scan: scanned by ClamAV on joan.univie.ac.at
X-Univie-DANE: verified lists-mx.samba.org
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
From: Robert Weilharter via samba-technical <samba-technical@lists.samba.org>
Reply-To: Robert Weilharter <robert.weilharter@univie.ac.at>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We have the following AD-setup:

Domain: USERS: Most regular users and groups exist in this domain
Subdomain: SERVER.USERS: samba server is joined in this domain

smb.conf has "winbind expand groups = 1"

After upgrade to 4.15 (latest version on RHEL 8) "wbinfo --group-info 
USERS\\somegroup" did not expand groupmembers.

Reason is, the default for "winbind scan trusted domains" changed to "no".

Queries for users in domain USERS with wbinfo still work as expected. 
Most queries regarding
groups do not work at all (group not shown) or give incomplete results 
(no group members expanded).

All queries for users and groups in SERVER.USERS work as expected.

After setting "winbind scan trusted domains = yes" everything works as 
it did with version 4.11.

The release notes for 4.15 state "`winbind scan trusted domains` will be 
deprecated in one of the next releases."

In our current setup this parameter is needed.

Is this expected behavior, or should we report a bug?


Thanks,

Rober


