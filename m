Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8851A27D8
	for <lists+samba-technical@lfdr.de>; Wed,  8 Apr 2020 19:20:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Ipd1uVacKwF/4yUpIYSyX62mDKDOa9yTD3AN/KEGyZo=; b=vSVxfgsZY9R8fRvzvIVKOzxE3z
	YV7CeGGEHHgEV17Nq9tOUVJcbnQp/n0AzbCkvYhevsuT07BNXzGM4mODpXstiGJkyEhGV0GBIFthk
	55bdddwkrj/FMulojdewxTDLhz8ujeuQs0gwxEJ3ln+pI9sPTTklqc+LyyaDAWp08C92t3khNL/z2
	OlmwLcEBL0yl+ATHS4HBWm/PQp5e8MOGuP8d0XEfRLJCL3wmAkdWLgCgN7mdYQWDuGFjsRHDPgMAB
	pylcDCatZo77x3DYtqqyCo+NsIkSL3m+6VAisQC53pPtHMQhQTuPC84C0Arn4um1cQZvKEMJbqfia
	t9tE/oQQ==;
Received: from localhost ([::1]:59916 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jMEMs-000CHd-H9; Wed, 08 Apr 2020 17:20:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37586) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jMEMn-000CHW-UV
 for samba-technical@lists.samba.org; Wed, 08 Apr 2020 17:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Ipd1uVacKwF/4yUpIYSyX62mDKDOa9yTD3AN/KEGyZo=; b=m+/TJQMH6eXm+KFadHXMw+ocub
 wq8Qqz05cNw9syn/vadYe5v4aP849rDRmUN9ya2gsSGvwPh4iBelPYNdEDoZY8XYi4ASEmpzSu6lL
 YOXkEJDOYGqYmlDgi4elDPvNYRygBoEd7da5cjqryaj+MsGqfyEG6PsbH7ye7KPB3hrnRQ5oLSjol
 Tt8TylSA61h5ifsBE4W1Ot1emTg14Xiqi4oc0Hx/Pppy420zEj6LowpaPVQVX57lPS9vDiFyTEbOt
 zd8E2LTKVF54aDNDFeC6ZKHQN0kLpQ4SLvfRKV4JWcN0IFcmFR10JJ/i6e7R20qAsLjuni6n0skjI
 WXd+KAs/KHAhus+G426OH+AzIakKh0rYeYoZzv3tuVph3wfgG0glPtmj7/k/6yhxroc7nwAICMK3X
 22DNPCotJeCK0M5ttGNdsk/Uf7WCt7rUvaq0yUjRQHHhnnVchCH1r4Rn0xLzagMb1ZCcTOt0r879u
 zgR1cbzVG3guVoLf3I/gEo2H;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jMEMm-0000Jd-65; Wed, 08 Apr 2020 17:19:56 +0000
Date: Wed, 8 Apr 2020 10:19:48 -0700
To: swen <swen@linux.ibm.com>
Subject: Re: tldap search paged
Message-ID: <20200408171948.GA13874@jeremy-acer>
References: <9ee1108dab93f774bb1be3eef0dceb711d2f1221.camel@linux.ibm.com>
 <20200408160707.GA8347@jeremy-acer>
 <697ec73e9ff11f54648f4e2519c3316031b53027.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <697ec73e9ff11f54648f4e2519c3316031b53027.camel@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Volker Lendecke <vl@samba.org>, uri@samba.org, metze@samba.org,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Apr 08, 2020 at 07:07:57PM +0200, swen wrote:
> On Wed, 2020-04-08 at 09:07 -0700, Jeremy Allison wrote:
> > You haven't explained *why* you need this code.
> Hmm sorry, I thought I did say that I'm in the process of creating a
> winbindd_ldap which is supposed to replace winbindd_ads.

Can you start with explaining your overall design
for this, rather than diving into low-level coding.

> The API is there already and wasn't created or changed by me.
> In fact, the utility code exists since 2009.

If it's there and not used, doesn't this tell
you the correct patch here might be to actually
*remove* it, rather than extend and expand it ?

I'd like you to think more like a high-level
coder, rather than diving into low level stuff
without a clear design.

