Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A7D1A2818
	for <lists+samba-technical@lfdr.de>; Wed,  8 Apr 2020 19:47:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=cFnRb35KITYiXc5eF/SgxVoFVPvKfxU0kSm3Rpu9TsI=; b=ojYYGEFg18sifFJTLnxfGxgB3N
	Vyx5OUqChWGYYZiVWfIWb93T4oxaPUp0Eewskr+IRZBZ1md+g0APiC7dzoRyVP0DomEIMZHWdD8HR
	9EOp3GTwn65/hVp6AJV2JdXpZdI/c/ptkjsbCvOVz4oSijFjEIB7CkWBBrWpkzsDuIyHzEq2I/C8l
	44i9hibSrZxx5Kuq+dV/RBlcf9CY5wShUikJtz/EzmHLyBLx04q4byylKR2GWP4PdDe8XvCUJ4CQ4
	RFyiAADY2mFUmii8NoTLEtdGP28iYXjdU0ZVmBxiILTNtHS6oKSOf0dE1+PeO+udzsuoZYDA2vMXV
	TgTfdjBw==;
Received: from localhost ([::1]:60670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jMEmv-000COi-UU; Wed, 08 Apr 2020 17:46:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45600) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jMEmr-000COb-0T
 for samba-technical@lists.samba.org; Wed, 08 Apr 2020 17:46:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=cFnRb35KITYiXc5eF/SgxVoFVPvKfxU0kSm3Rpu9TsI=; b=iyWYOO9jpyKaaTDxQ3bSuXrGWo
 iVb95VfTiaBQhFWRTaeRVfVjBK1JFKtcb1gbRCKVcRDdXA3Gyod/RXq4VIupitJaEGEq+M49GGjNh
 KY0fwDH7HLkd0RQKXjnUwEPocU1LmjdCU7FwhquyA73M3lRMr9XC1u/WnOwSwAHbGGFZs+zTTSG1t
 xwruPrxZRRKShd+7C1PqtJfK0g0DmwpFIl9Y26JF20XUO5QdiDN3GaVzEE7WhJ7q14LFz/ooP4c5d
 m+1utS+BXySyBO78YXx0aUVw4xHhEUI3D2WuJgkBN0YA27KDorLEx6qqKPwfcobp5xK7wNeKMvQq+
 4zxcFFwq+55jCuCxKZEPSOBIpluoAIZp0XSvqaJwgloSXdks5M5yDy9xzS/AAyAMkmB9HQuTARlpR
 2voSOZhjAbKB5qFw1bGla315PImRFj5dwK9Nc6sWrGY+Zb6NFKHve7OSciHVK1jEpmuZtPM65iNNV
 eub+d99HTFfbvcNzvYUdoxiL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jMEmq-0000U5-83
 for samba-technical@lists.samba.org; Wed, 08 Apr 2020 17:46:52 +0000
Message-ID: <08e6e30fb33ebaa5125b64cca81a5afe24a2192d.camel@samba.org>
Subject: Re: tldap search paged
To: samba-technical@lists.samba.org
Date: Wed, 08 Apr 2020 13:46:47 -0400
In-Reply-To: <9ee1108dab93f774bb1be3eef0dceb711d2f1221.camel@linux.ibm.com>
References: <9ee1108dab93f774bb1be3eef0dceb711d2f1221.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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
From: Simo via samba-technical <samba-technical@lists.samba.org>
Reply-To: Simo <simo@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Swen,
do you have a design document for this winbindd_ldap thing ?

Goals, uses, architectural choices, etc.. ?

On Wed, 2020-04-08 at 08:32 +0200, swen via samba-technical wrote:
> Hi Uri, Jeremy, Ralph, Volker, Metze and others
> 
> I know you all have received enough emails about this subject
> already,
> but I'd like to ask you one more time to revisit merge request 1258
> 
> https://gitlab.com/samba-team/samba/-/merge_requests/1258
> 
> I'm not sure if you all got informed about the comments / updates
> since
> our last conversation round, therefore, I'm sending out this friendly
> reminder :-)
> 
> As stated in the MR, I have updated the code according to your
> comments
> and suggestions, including an abort mechanism for the async-callback
> variant. 
> ...and yes, for now, I threw out the _all-variant.
> 
> In order to re-start my work on winbindd_ldap, which is the "real"
> project I'm working on, I need to have a stable foundation in the
> tldap-area.
> 
> So please, if your time permits, have another look at the MR.
> 
> Thanks in advance for your support.
> 
> Cheers Swen.


