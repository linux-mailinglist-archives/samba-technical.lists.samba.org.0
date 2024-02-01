Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7678462A8
	for <lists+samba-technical@lfdr.de>; Thu,  1 Feb 2024 22:33:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=hKcrS+P2xQ7IJtNn6QL+qtp5QZhG1/2a0Phy2C5Dd3o=; b=j4ze0GEWuVPl6FVaMUvGR+18Yw
	V+z0foimo/wt9/VCFHlpIEnUbCEhYHxOckR+lRFHIWplgKSkqQzmRTdPL1K9o1ZAlRsvgKugoeQ8b
	SXGubX2ssElfJzqePE5pv+TmNK11k1FR0TCBlfFIx0aEUsXOacLHsQUNft0oTY4QDdjlUeE+tQD3V
	CLYI9OCHjtFf+ldc05rkrRnNH5uQRjNHUzgW+6khhooRTVcs8bQ3W+chSQLVO14eggihEaqJ6R29k
	6ii4D4UjweMtMWoGzqi4RPDAGeoBuAM/IEp9Dp7H5fgOfhiocRyirNGc20o9Zs3BiEQhU+pXL7lOx
	Jg4jq+Ow==;
Received: from ip6-localhost ([::1]:58666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVegp-007JFc-Ep; Thu, 01 Feb 2024 21:33:43 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:53976) by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVegj-007JFV-G4
 for samba-technical@lists.samba.org; Thu, 01 Feb 2024 21:33:41 +0000
Received: from [IPV6:2404:130:0:1000:2225:64ff:fe75:8a7f] (unknown
 [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 00CF0817EC; 
 Fri,  2 Feb 2024 10:33:29 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1706823210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hKcrS+P2xQ7IJtNn6QL+qtp5QZhG1/2a0Phy2C5Dd3o=;
 b=q4Sf2PTEDd1sf16dURtyxy5vFTx8mtZlbNrwaxw05ks1bsUV9ELVDRWZbRYP34thJtntxx
 +O62f46dzVAkwUByQr7Futayb8+6QKxl/8LvwL98zefsePKrgmlepqW2C54puoTX0k+AA3
 JD0fHfqj4MxDysXidUvh9EmMDCwNwfU5zAyo6Jw0DPNEgFpD0ccSSzFb1xmhNDMQrfaCSl
 QmN6S+Co58lNMFURWPVC5ao3HVSQceg8hzfU5hqLcaZUUDf4QWj9njzupffTkApDCWZFBK
 VltkysDPOFH+ZNFoY41dt8pL8e/Tq/MK/vOYPVltnl3uzYmPQIqM/eVNZ6Z3RQ==
Message-ID: <df237dc3-d1b9-41ab-823a-fbac5ce9df22@catalyst.net.nz>
Date: Fri, 2 Feb 2024 10:33:28 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question for time based group membership in FL 2016
Content-Language: en-US
To: Kees van Vloten <keesvanvloten@gmail.com>, samba-technical@lists.samba.org
References: <14cf1029-2378-489d-bf9b-844ed9d67081@kania-online.de>
 <6d845bb3-3348-4025-abec-e749287d7392@catalyst.net.nz>
 <728bedf6-dcf3-4006-b73d-9331db2b8777@gmail.com>
In-Reply-To: <728bedf6-dcf3-4006-b73d-9331db2b8777@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.09 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,lists.samba.org];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

hi Kees,

> Still, if you know what this powershell call changes in the LDAP record 
> of the group, the user or elsewhere in LDAP, you can mimic this 
> functionality quite easily with a little cron script on the DC.

I had similar thoughts, but it sounds this Windows Server 2016 feature 
is a bit cleverer than that -- in particular, the KDC will not issue 
tickets that outlive an expiring group.

cheers,
Douglas


