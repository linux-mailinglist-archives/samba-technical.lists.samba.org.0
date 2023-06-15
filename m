Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB657731B85
	for <lists+samba-technical@lfdr.de>; Thu, 15 Jun 2023 16:39:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=8bzXAz0qph7w8v4c4V/0qnagQ2PM+FiyFH83J6pmNPg=; b=QOHQzXPJHcb7++/SIGcW3LGbL5
	yFTeqQKMSahc3JNgkMqTRgXNfuy7X+gd+IGcxqT9DyTMZSRcwiLDMCjD9mz9tTc0YNS7S0+b1zxnW
	XtFrAXBHgKXk6/nyG9+y9TLle9fnXw1W92iAh/VIBRTyNNwML1epmbNjS+sCjybP/sTo8io5HzDO8
	SyOFSpSCauox1sHy5EPTQPWbqFCN2DxZOoATAeXqYXgrG8KI4Vfi6tJRQZEkct7UhFqu2dJVmLyeJ
	OVKdPwGxix9WtGJbWG2mDK77SteYoETIQIP+kF9D/4XMz+UjSjS1z8bZxHKBckAZTH5LC58AkrVbD
	I6lLbXMQ==;
Received: from ip6-localhost ([::1]:63310 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q9o7n-002YwI-0s; Thu, 15 Jun 2023 14:38:59 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:56325) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q9o7h-002Yw9-6k
 for samba-technical@lists.samba.org; Thu, 15 Jun 2023 14:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sernet.de; 
 s=20210621-rsa;
 h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
 MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8bzXAz0qph7w8v4c4V/0qnagQ2PM+FiyFH83J6pmNPg=; b=YuqgONTS97MVl0o0oz2IWmTOXa
 911Wr3Zzzwkf5Bzo08orW0ALfc6m4O4FNLV3almJIXxQTbA+DUx/fRysdi1lHTmB88jA8CSFO4h1Z
 s/syfDK10dAsYni22Pp+2C/eUuImluy0PiCITp2wVsfwMjEaYzaoftOLZjj5oS3Uvo5HLwI7Imozp
 5CHKkcTejUgARje9S1tkSYKUT+E6h1gEKbQPhXGvYeF8O+F9ntTiOEn/k5Y3+vjrANpeWlleWdmF2
 3hS+bXVU7+9PMp3aqXW/GVrSoIr7WBIle7YyJvEZMNKx4WrIAy8sbWbGMbrFBlHRzXtsRyxWoIacP
 D+NSGQMQ==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sernet.de; s=20210621-ed25519; h=Content-Transfer-Encoding:Content-Type:
 Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8bzXAz0qph7w8v4c4V/0qnagQ2PM+FiyFH83J6pmNPg=; b=nWuV6dT9MSKMBNnjo2jacU4Zfh
 AW8+dqvPzm8CEPfzIv+imBRCy39P7oqQ4AFECtSVVRj9g8kRMBGINfon9SAg==;
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 for samba-technical@lists.samba.org
 id 1q9o7e-00D1XI-Tm; Thu, 15 Jun 2023 16:38:50 +0200
Received: by intern.sernet.de
 id 1q9o7d-0027Vu-Fg; Thu, 15 Jun 2023 16:38:50 +0200
Message-ID: <e6ec1cbf-a5a0-ab66-8aff-500d3a3ed444@sernet.de>
Date: Thu, 15 Jun 2023 16:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: samba-technical@lists.samba.org
Content-Language: de-DE, en-US
Organization: SerNet GmbH
Subject: New option for samba-tool dns zonecreate
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: =?utf-8?q?Bj=C3=B6rn_Baumbach_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bj=c3=b6rn_Baumbach?= <bb@sernet.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

I'm planning to add an additional parameter to the samba-tool zonecreate 
command. Currently there is no option to create new zones in the forest 
dns directory partition via samba-tool.

I would like to add a parameter to choose between "domain" or "forest", 
which defaults to "domain" (to create new zones in the dns domain 
partition). But I'm not sure how I should name this option.

In some commands we use "NC" for naming context, like in "samba-tool drs 
replicate". For the "drs uptodateness" command is a parameter 
"--partition" to choose a specific partition.

The DNS GUI in Windows 11 lets the user choose the "Active Directory 
Zone Replication Scope" with the options "To all DNS server running on 
domain controller in this forest" or "... domain".

In the code there are two flags DNS_DP_FOREST_DEFAULT and 
DNS_DP_DOMAIN_DEFAULT. So maybe something like 
--dns-direcory-partition=domain|forest?

What do you suggest, how should I call the new option?

Best regards,
Björn

-- 
SerNet GmbH - Bahnhofsallee 1b - 37081 Goettingen
phone: +49.551.370000.0 - web: https://sernet.com
http://www.sernet.com - mailto:contact@sernet.com
AG Goettingen HRB2816, CEO: J.Loxen, CFO: R. Jung
data privacy policy https://www.sernet.de/privacy

