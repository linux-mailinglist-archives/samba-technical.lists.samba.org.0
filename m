Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C92BC1E6C56
	for <lists+samba-technical@lfdr.de>; Thu, 28 May 2020 22:18:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=bKPYp+myRNJKroEEvGMenHCfeGN3vO0zT6i4uYGCVlU=; b=GyOOKXdcso1hOPmhN3aXHzqGE5
	IlRYBP/YlPxodKYO/sGhcPALKXwKuEaNCjy+IVI18/zRP6OjgRdv5vlv3qBhreHQYMUvWk5T44lJO
	RQeINpMzao2i71aNz9lYYjUnWgAQx6qLdxKBpeL2JnHL+0YDpEPE96GiNDHUW6frTbp4ExrEuTUFu
	0A9qLRjaWDpKi7bvMVvPObST6/ImSPzUMEd4AI3O6FMWGqh4BoAXDb3VMTjzAWm3tzLekxqoHPbKX
	RgZFNoGFhdJcD7FFbURsH7GV5SUBXV3FBAS9+nOASCqm9uKoSibS9p4NUVfCE3uGLKSZNt0qx+RiH
	oCBYXozQ==;
Received: from localhost ([::1]:29366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jeOyc-006Ew4-5m; Thu, 28 May 2020 20:18:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46694) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeOyW-006Evw-DN
 for samba-technical@lists.samba.org; Thu, 28 May 2020 20:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=bKPYp+myRNJKroEEvGMenHCfeGN3vO0zT6i4uYGCVlU=; b=hcRSHjVwlwNwM4uiMdpjwTQ7xL
 sT0bCIWG45UUCYQ/rjy03SdNmxQFWxHdfQbfQM+9oAH7imPVWUB4cMORidCv7SWklc145t8g/QncZ
 L56YCO077qTiRinrSwINu9i/gSThLFHDP1fWFJDO0ELIBqStC4JFrtbpbbskF2WNLYoJnh0YP/Y61
 bp2qncRtgdVgffRSxqJyHH2XS8S/Ymwxv5Bn02I2kGyFpvtk3WuI28fZLL/jN5fVjqRSOpXWoMu1S
 2mDdkrvDGtJSFz9jKwYG905rTkxle4k7pyBd5Sm+0lSbFfcih8z8dAwP/CbL8xIxGVyfbw12fzt0u
 9TxANhy0iO02P46sAB548CCZxCGCBwScF3larGTaUV3Gve7syibLLXU+NJdmEyjKGWolob8ACT72R
 z71DWm/gU4EZqeiIG1c5TbZNwkPqDYkGfCDxisnl7N1E+3VegCO/YTgqPFVgapn6T080O4k9EsvGr
 Ye/SZhNiP9rKDeBHAceTb5Ny;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeOyW-0006QC-4w
 for samba-technical@lists.samba.org; Thu, 28 May 2020 20:18:00 +0000
Subject: Re: Checking if Samba is running as an AD DC
To: samba-technical@lists.samba.org
References: <CAH72RCXPNq2R6p7G61OCztSrdZrqXO6G5L4azhUSgQxqT50K1A@mail.gmail.com>
Message-ID: <748f3665-cfe0-4b79-b0f0-936eea8d7b47@samba.org>
Date: Thu, 28 May 2020 21:17:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAH72RCXPNq2R6p7G61OCztSrdZrqXO6G5L4azhUSgQxqT50K1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 28/05/2020 21:00, hezekiah maina via samba-technical wrote:
> Hello everyone,
>
> I want to first express my gratitude to the entire Samba community.
> You have been kind and very responsive whenever I ask for help or advice.
> Thank you.
>
> How else should I check that Samba is running as an AD DC apart from
> looking at the smb.conf file?
> Is there a process that gives me this kind of information?

This is Linux, there are several ways ;-)

Two that spring to mind are (both run on what you think is a DC):

ps ax | grep '[s]amba'

host -t SRV _ldap._tcp.dc._msdcs.$(hostname -d) | grep $(hostname -s)

If you get any output from the first, it is a DC. Same goes for the 
second, but it will also work on any Unix domain machine if you remove 
the pipe '|' and anything after it.

Rowland





