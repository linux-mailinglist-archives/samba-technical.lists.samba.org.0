Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B43FB743B4E
	for <lists+samba-technical@lfdr.de>; Fri, 30 Jun 2023 13:59:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=bWwwj1njHqU85mjwejBsI66+IeqPMM6oKMf0QndEbxI=; b=ujI+wBq7/SgU2GNYbPMxKXDmMw
	qzVHis29hanzFjisJDyRoGcWgU24Ms72pvEJ/46+E6MHK+7A1CGEtbiL3+RzGg4kTzznuvB1Y5KGx
	y40U9oGnYbzKDBt5i2UkKrOV2OLQgEzRNFkoAw8EN+qEpjG7gcuG6rV11XgAuo0EOe0c1LzhB1Cf/
	BeFWg/FEhga/BA54UcWmvVELhnXLkCqnxCv95HbnqAgw34p35BHcJLo3447TJ6xK/nn8JOZRRA3Iu
	xjztRDlLM8V0HdGK2RXOh6/SOxVhlpDori+Y8sDV0S63Y7l/NzRaAz4D6AhRUr/2+7kLOFsuyumJr
	HevTuR0g==;
Received: from ip6-localhost ([::1]:52372 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qFCl8-005Les-Ry; Fri, 30 Jun 2023 11:57:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43280) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qFCl1-005Lej-NX
 for samba-technical@lists.samba.org; Fri, 30 Jun 2023 11:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=bWwwj1njHqU85mjwejBsI66+IeqPMM6oKMf0QndEbxI=; b=u6d0A/x2Ew73AZw4lOgVgVB2hH
 JbBxr39QWWP8s2qhTzj7TZcyqdLI1bsQjaHy6yR56mANJUFAmuXJ1/Jw/zG50ktDd3JhHDeb/rZwM
 L3q0DR3d7Ouci8YYLDyWFO1t//YT5hnoFuWphFrKWihyfhZBf7/Hucf010+gCZ0eyICp42fSnMa04
 TwlLW1pNnRhJa7+Jqpanm8WPa+3OpMxYAM/yOu34JLJnM7lqV80q459nPJCyQzBMeREbqXZl5D/el
 tRVNOyfAihT/imkQt0Ly2H0TNcPjbZtGAfkj+nnvG2/1SfgqPf0GL1Bb96uyCEsyag7JOU+mHCsNP
 yzuupFtF3M8CjL/0ljoDLNwMa+knSRqqz8iclPRMkeeeqw5nLd/vE1eKTmQYgWlI/H653eD3NN8tf
 i2/2kr+Eje5t30sFGORiTgIjaRYTwNq45+sO/wxJ+KXxpZOifb9Dcroola4QezEAtRg0rCu8cuXeS
 jKAXJPAE6uq9sYsEXhi9MweK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qFCl0-005NT8-2w for samba-technical@lists.samba.org;
 Fri, 30 Jun 2023 11:57:46 +0000
Message-ID: <f3914c4a-4cff-507f-406a-bbef66e9072e@samba.org>
Date: Fri, 30 Jun 2023 13:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.18, 4.17] Samba 4.18.4 and 4.17.9
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

Samba 4.18.4 and 4.17.9 will be brought forward by one week.


Samba 4.18.4 is now scheduled for Wednesday, July 5 2023 and Samba 
4.17.9 for Thursday, July 6 2023

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18 and
https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
have been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


