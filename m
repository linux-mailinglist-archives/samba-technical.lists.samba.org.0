Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6147E9C72
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 13:53:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=BYBuKex40/CteWpoyRrzBsDAcTlbhZo2I0yI84FoB3s=; b=EKTNym3eVx8WSitet/yx/xQdDa
	WVdz6pdpYwif3t/RDjb/Bl+3NRgR6i/39pkXLGlDFa0/i7ee2ea1IGxHIGU54b3K8YXb8WYaKLx0n
	RsKuNdiDYHrvc2lJNFl5VzCYiefhTiqyrGVDYyI+GIvguD6ucU4WEINAx9IAn4WX1N/d3KrrEziTO
	arEmY5Y4RA7etdbZn09DLlwO9X5ZUJwDrb+ezLA+buItCH2jp7JJ0pgXIrTPXdMNaDD8gK3T/kycz
	ymYET4Zuiyftah9xIWtWqH+O/hpP8IK/9xJz3N1+38OyaexrMXaFvEaS8vE0/BjJZo19giHvrRtaj
	Ocr31TvA==;
Received: from ip6-localhost ([::1]:26214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2WRY-007tjm-7d; Mon, 13 Nov 2023 12:53:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38914) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2WRT-007tjc-EC
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 12:53:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=BYBuKex40/CteWpoyRrzBsDAcTlbhZo2I0yI84FoB3s=; b=exkQ7BCNLtcEXLz+F3QQYZ3WAc
 ZN33uavVt0Xm7gjuSkhlTG/vGA+I9A1+27PILcYNys6SwV2sGFaDi9rQVOYTYTdusR3YlalhVZEsF
 1NhTKLhYGkEROlKebI0fQdwpa83PyOTq6n+QWJl1RRojcYHUC2U6k14ZGKDy2s0xUZMSzFSDv8wxL
 laNfyZJlunaLhzCTkC/z3L+G6sF+vamsqEdmerXV9BdNkmzI8xKbKrvsS7Hamob3ibdMZPbkHeRUv
 OKybOBKMaV70LG9TNUnjKn8CMao1WNWFZQNBgEVEa8YueS6jJoNdL1Z06/PcDJShhQ5gdJx+eOvXO
 /6M/RMZJ+Hx5fTcDQgWWe835xCLOmfwJ2odBH9hxf1ifobDsDkVp4CYz3lwDV84+QR2BGYoarlLbu
 lLP+omSahOXbHuV4kbGfqri3S1xAONOse0eaC68q2yVSiHBKnwqPWsQ3N1jIs/ffHD49Wj9aZcJyG
 haxGcQIqsLUH7rFeWX5VqXd5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2WRS-005uio-2W for samba-technical@lists.samba.org;
 Mon, 13 Nov 2023 12:53:26 +0000
Date: Mon, 13 Nov 2023 12:53:24 +0000
To: samba-technical@lists.samba.org
Subject: Re: Audit log dsdb_group_json_audit with with "userSid": "S-1-5-18"
Message-ID: <20231113125324.0cf1b58b@devstation.samdom.example.com>
In-Reply-To: <CAOGObpiMd0krLek4p46SYHTZpDwRGfGdD9PbxH_QUvVCe30-OQ@mail.gmail.com>
References: <CAOGObpiMd0krLek4p46SYHTZpDwRGfGdD9PbxH_QUvVCe30-OQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba@lists.samba.org" <samba@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 13 Nov 2023 13:37:42 +0100
Cristian Galvani via samba-technical <samba-technical@lists.samba.org>
wrote:

> Hi!,
> I have 3 Dc in my network, I enabled dsdb_group_json_audit on all of
> these to json file.
> smb.conf:
> *log level = 1 auth_json_audit:3@/var/log/samba/auth_json_audit.log
> dsdb_json_audit:3@/var/log/samba/dsdb_json_audit.log
> dsdb_group_json_audit:5@/var/log/samba/dsdb_group_json_audit.log*
> Everything is working as expected, if one my colleague on his local DC
> change  group members the activity is recorded properly.
> The problem is this, *on all DCs log file in the same moment* there
> are some strange  activity recorded with userSid "userSid": "S-1-5-18"
> and "remoteAddress": null.
> all the activities record the removal of members from some security
> groups but some members removed from those groups were not even
> present, I am sure of this information because I restored a backup
> prior to the activity and the user was not present in the modified
> group.
> 
> Any suggestions?

'S-1-5-18' is the SID for 'NT Authority\SYSTEM' and should be mapped,
what version of Samba are you running ?

Rowland

