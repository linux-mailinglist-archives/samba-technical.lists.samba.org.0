Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1196C0475
	for <lists+samba-technical@lfdr.de>; Sun, 19 Mar 2023 20:39:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tR4jYw8gdVdcFqTm0qP8yO/zAGqyqdR6jTYoCTA/EHM=; b=gFOZpWKkW0AZsAXIA3nkb6QJsJ
	0RgICev6rEgIsS5fs9IF9pThsafrFbOHbucBHVF9Kk+FUqc44u0DRwMXcPpPdEoJH6/BB8eUBLQzw
	fZix4D4Ppepc1FVy+F2i+VQ9Si1Q/SbHQoAfFrhdjqgxd1mdzu0J+rLN0GueY+6qSv1SfaYGFFzmT
	xCJNQlCB+UOYOEW4jjDvxsXncXIdWZbs+GYgdBPQTz6bsqsMMMmy6xz8bBckwCisf/I0e780IOVC6
	iGws6j/o4g5p6yWDjtuUQTn4cOHfoBKyyOA8Wz1wkM314YQocmHfodgTKMZzH0Sjl883mczppjvBO
	P/qVI0Jw==;
Received: from ip6-localhost ([::1]:34218 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pdyrf-003SZt-P5; Sun, 19 Mar 2023 19:38:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57192) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pdyra-003SZk-I8
 for samba-technical@lists.samba.org; Sun, 19 Mar 2023 19:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=tR4jYw8gdVdcFqTm0qP8yO/zAGqyqdR6jTYoCTA/EHM=; b=vJYTsGevef4dJ1l+s6usyT/uy+
 hxAFBQowKIjIJnVSyAq+iVAHiIidX07zfrzjSS8vva0Ncb5j1w2WdMqKzQjE3kA9Fch/djyVbejI/
 GvoH/F+RZ1V9twsY/RW5tvjBzdVWKbdxP6HtkipWP0o/5GN81yFFutWvAOwRTB8TmJCyjDJDuTNCH
 m/iDrwsaCOVivCp0zrY7ilIhnOfIX2DK2ePKRU1hlUBTpplWIFKqLaungKQXLijpbsisMRFAkxfXO
 k6+ircEA9bFoyWTSNBMSyjYpnCKpQLo1GwkeaRki7h7schBiOx0DqelFXtvYvR7D82uTmYrJHx4iP
 4u5H+mi0YTkh+3YipOSnvFjyDxWyxK+k7M0HmsYFGl5mdwC+9fRsglj4gHv/tfHVsDQEApBQLOn7W
 z5Mkp9U6iPOwYdqvGM/27Aj9k9c99DdskVbFgZEoG7uXsmbqcU0sWcGflJr9giTN2gjlj0MS9HFbz
 8RkPL8IVM/LFn20sE3b84BXo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pdyrZ-004Etk-2K
 for samba-technical@lists.samba.org; Sun, 19 Mar 2023 19:38:41 +0000
Message-ID: <581377dd-45bd-536e-e89a-067262c28478@samba.org>
Date: Sun, 19 Mar 2023 19:38:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: mit-krb5 and heimdal binaries
Content-Language: en-GB
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
 <ZBa55+81hGE4QF7k@pinega.vda.li>
 <31194bd0-05a5-9549-5b6c-ef37bd5d5c17@samba.org>
 <ZBbC2rDQ5eMwkBVO@pinega.vda.li>
 <fc2818e4-cf75-1252-4d8d-8965ab2e6039@samba.org>
 <ZBdgWLxO/f0nts7I@jeremy-acer>
To: samba-technical@lists.samba.org
In-Reply-To: <ZBdgWLxO/f0nts7I@jeremy-acer>
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 19/03/2023 19:19, Jeremy Allison wrote:
> On Sun, Mar 19, 2023 at 08:56:52AM +0000, Rowland Penny via 
> samba-technical wrote:
>>
>> Alexander, as I said, I do not have an axe to grind in this, if Samba 
>> decides to move to MIT, then so be it. You however, do have  an axe to 
>> grind, you work for red-hat, who are on record as saying that there 
>> will never be an AD DC on RHEL. Are you now saying that, if Samba 
>> moves to MIT, there will be ?
> 
> These are not productive comments. Please don't attack Alexander
> or other Red Hat engineers who are working on Samba.
> 
> It's also not reasonable to try and force Alexander or any other
> Red Hat engineer to make "official" policy statements on behalf
> of Red Hat that they're simply not allowed to make. That would
> be very damaging to their career, and isn't the way the corporate
> Open Source world works.
> 
> Please step back and try to be kinder to your fellow engineers,
> and always assume good faith from your Team mates, as they do
> to you.
> 
> Jeremy.

It was never my intention to attack anyone, I was just trying to elicit 
information.

All I did was state the facts as I saw them and ask a question based on 
the response I received, Alexander seemed to be saying that there was a 
chance that there may be a Samba AD DC on RHEL, something that I thought 
had been ruled out.

I also stated that I think it is dishonest for Fedora not to actually 
say that, from the Samba point of view, using MIT as the kdc on an AD DC 
is classed as experimental.

If I upset anyone then I apologise, this was not what I replied for. I 
initially replied to a post from Michael asking if it was a good idea to 
produce two versions of Samba, one based on MIT and one based on 
Heimdal. It sort of all kicked of from there.

Sorry

Rowland


