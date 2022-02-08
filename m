Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A224AD07D
	for <lists+samba-technical@lfdr.de>; Tue,  8 Feb 2022 06:14:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Tt0Qjj/5vkbX4ek0i83GpSuBxnxJzTeFXv57C6EqFco=; b=RbUcr705afSJA4MLgfYUvbtJpB
	1E6Ry5sebtARfZQv5yL1H2M+44ETOm4uSbxe+gxTzQI4ep6S5cnK8Bce1PwbtICtafAjDN/TYKQMC
	RWI9R1NoH4x4hQbKafvh0SurwpNlJmiC/a2qE7p4YdqLQ65VPlSIwCDZkkot/kkZLVnMcy65DlURj
	jJd/Lw96RZ9It/jXfsJGTvY/BdFreuhPpZIXmjKCKMK35mXS4g9ddyW1ENv0FrDnp0w+Dz+H9m7/L
	03/7yUUtVshpyspz+iaQ3JtpGff229eP04uOUmRI/Bgp9P+WrghYvYM55YxMrd3EGBipwoZcDed3Q
	gwjzjYXQ==;
Received: from ip6-localhost ([::1]:65274 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nHIpN-005ctp-2K; Tue, 08 Feb 2022 05:14:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48748) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nHIpI-005ctb-Hx; Tue, 08 Feb 2022 05:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Tt0Qjj/5vkbX4ek0i83GpSuBxnxJzTeFXv57C6EqFco=; b=PzpENqtTfJR2P44Ox0ciYe6X7b
 fJoTpCW+zb+rfppQ6sU+bs0jpNLB312R4VWdTguQq5hDmNIfY9lbEs55dDh5Y5J59vGPYFuRVc45e
 HNZ2OBdrbIXPPO434mteEx6FbPXWgqS9788FhSmYADW/eF2qm9LJTCGA6KP6wrsfoxEFlenn9Ji/S
 /japGIATTlYB/1M1dRWQjZiO0Xhv6IP/Psf42Ujt1N58bJVffxsx9q1id+UISVpNO+6y4MpCgCk7t
 53FlpHuf7xdsOPgejXp4WIAd6b3SGFAJvcKVWX00iCNL9yRmAlt1Z8m5Pf9AWYBdzEOhO65dxQPya
 ohfXrLlnnUTW2B27kNQ4QEKL9qO+jTWNmMGDITEUgYjKriXBq8pfGyvd7yKUzQSRAgJzB38c/6ZtZ
 W/cicGAYg1JWFo7tpojM5GtcYcE5r+TtrD0MxIVCiY5qALLoWmu+sixRqNNp5BLyqhmdEeq23CAzY
 bgb4tyf7JbMhKVtG/xfKh0f0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nHIpG-002dtK-OM; Tue, 08 Feb 2022 05:14:03 +0000
Date: Mon, 7 Feb 2022 21:13:59 -0800
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: [Samba] Remove LanMan auth from the AD DC and possibly file
 server?
Message-ID: <YgH8F7/VoCe0pUyv@jeremy-acer>
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
 <28c3b502-7146-4403-b728-4815dafa9110@samba.org>
 <4406c0a37ed78d50bef9d10198fb6e565e633588.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <4406c0a37ed78d50bef9d10198fb6e565e633588.camel@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba@lists.samba.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Feb 08, 2022 at 06:04:01PM +1300, Andrew Bartlett via samba wrote:
>On Mon, 2022-02-07 at 18:38 +0100, Ralph Boehme via samba wrote:
>> On 1/26/22 04:50, Andrew Bartlett via samba wrote:
>> > What do folks think?
>>
>> I would vote for removing it and if people still require it to work
>> with
>> old shit they can just continue using the latest Samba version that
>> supports it.
>
>Thanks!

Yes, to be honest I'm more leaning on supporting Ralph
now than trying to split hairs :-).

If people want LANMAN auth they can just keep running
the last version that supports it. It's not like they're
worried about security anyway :-) :-).

