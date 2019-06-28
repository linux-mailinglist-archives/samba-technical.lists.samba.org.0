Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F2E59A0C
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 14:08:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=OkP/TXzN9PSrkm3O9MLQxemxD5WpnbG3bOeFScEl2/0=; b=Gdu7NRpYU8FNmzZimWq8DdHrHA
	tZ1OJH1UBKPvin8vNlm/edpNpuZ+XfVqM8Bpoii6PbOf2jgSt7/znXlCqelJAYiut61gkOiqDMRbi
	CXMWt3e1JIBufN3DoZOGC6JjjlPgmViIHcFFZXflyiBbXVw2Gj2q1wHac/bc0DY/bYkKOT+bq+bRq
	ETGC4XA/eSZv/X4KRUhTgIAHPcfIO89SIeWx1+ln3m1tAMOGveaCbZpio5hPRkXBZn0MiFfHqNkW2
	d3+XwWInseMVk8VwUstgvS8hErWuXf4lmfngNYyI/cSDxh3V9g8bBfSpnV5SAR92dc7Y4EilbB6NC
	hhuxxRoA==;
Received: from localhost ([::1]:50078 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgpgA-002M8a-Pk; Fri, 28 Jun 2019 12:08:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20852) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgpg6-002M8T-SO
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 12:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=OkP/TXzN9PSrkm3O9MLQxemxD5WpnbG3bOeFScEl2/0=; b=R5ydOThTcZU/m6M40hHIGWef1u
 qzf2qKkmEeTujY+uKW9vodsvavbLn2iBYK0GqgJgWiUwTx6pyNUW3gjPWvGcVOtmqVLc8nlRqUI6f
 79lLpqli615h/fRMjFEoGRXMmrpmtsoy2lorxFHS2Drchv/DckzjVhZeG3+AqTyhNPW4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgpg5-0000fS-Qg; Fri, 28 Jun 2019 12:08:30 +0000
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: Michael Adam <obnox@samba.org>, Andrew Bartlett <abartlet@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190628104624.GF32415@samba.org>
 <62bc808700dca7a08f3a61c6d7e676119c301843.camel@samba.org>
 <20190628114651.GB5892@samba.org>
Openpgp: preference=signencrypt
Message-ID: <d2f00126-4507-23de-df51-d41ee28b639a@samba.org>
Date: Fri, 28 Jun 2019 15:08:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190628114651.GB5892@samba.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 6/28/19 2:46 PM, Michael Adam via samba-technical wrote:
> 
> Ugh. That's really strange. Is this a gitlab design choice?
> Because if it is, it's finally a thing (and quite a major one),
> where gitlab is way worse than github. ;-)
> 

To be fair, I don't know if GitHub even has CI. What I've seen in  FLOSS
projects is that they have their Jenkins/Travis instance or something of
that sort (and who knows how many runners), and each PR would trigger a
run there, and success/failure would annotate the PR. GitHub just
provides the webhook.

I do agree with the bottom line though...

Uri.

