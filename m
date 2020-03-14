Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6466C1855D4
	for <lists+samba-technical@lfdr.de>; Sat, 14 Mar 2020 15:15:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=YyStTP/ju9vFPXnzKo6tBL6TvuA+Ee9qSo1375wZqTA=; b=oj0eO3aHS+VVzJXnJRztXT/gPK
	dn4+7spYAXFieuruoLjRCbAgiTkg1jWwCLRvmZlhhT1xuNwLy5O9OL/m0YbmxL3lIs5M5CmsctugB
	9McQYKtCySykx/6Rh1BcVAL/YBiWy54ahVbYh4kzeZ5V+nkhtz4FehzwyHLwxPNJKVSevezQ0+uar
	2pySPAS9ectYpa7Mx2FRv5nrkiPUAezHCmRl9OY8HeMvvqpHFBawyJcl+h78s/d1RtvswKyup5752
	18xDhnYlGrW+R9NZyoM4CmF8SZ1Q0TbGEOxoSCpEIv0WgcLRqsmfbyBWN2LDsbBdF/Z35QP4kUwvo
	AoRlJWSA==;
Received: from ip6-localhost ([::1]:42642 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jD7Zo-00G4cj-UL; Sat, 14 Mar 2020 14:15:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23836) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jD7Zk-00G4cc-BZ
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 14:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=YyStTP/ju9vFPXnzKo6tBL6TvuA+Ee9qSo1375wZqTA=; b=M02NPQ0lrvROtvofq3vMfYRb7q
 dQwKtH76uhJnTXm4OSfkkTXxgZtxYeqnHszpBYEuX0C8TBTCypuSrrjFSZJuG8qDT5w4ysPbFLgRJ
 QHV5QZD1QK3bBL6Jj+lAw4+hf2KXKfY6EEA+KRrjlB0TdaqIZobbRWah2n/78rS75VLNo7RLOxXRF
 2EXMbS9+uEKvvtU7c15UK3+hbXB1HPDhA6V1Nf7yByoBHpdKQo3b79ZfN7/k/xZUtfTpo3KdxO8ye
 rh4OxGMOlulY9Gbfmn5cGGYr8ZakIZznyEFRqt9IVVkslxTa8WNwGBRqHDgdxqAvQVnPXImLsDoYd
 ZJJn6pua+quQhFgOlvmRmP4hifLUxkDBorz7UIY0OEhWk8R2GhovE1M4xJC9HvMPrIfPuCyJy8K+n
 Qqh7PvitaGBKWdb3a0r/pPiDK+XJx2XEr/yMBpk2XHX2EakCbHTzUaU7nFx2ojVBlKf6qeDNwHUUp
 xdaVmyDrLptZ+sSFaBAQNC8l;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jD7Zj-0000TP-Sk
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 14:15:39 +0000
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
To: samba-technical@lists.samba.org
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
 <20200309100715.GK2735275@onega.vda.li>
 <dad25a37497ed4d4b70829925da512b3abb4eb39.camel@solinos.it>
Message-ID: <52a0f365-579c-5adc-a470-7cf543a0c868@samba.org>
Date: Sat, 14 Mar 2020 14:15:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <dad25a37497ed4d4b70829925da512b3abb4eb39.camel@solinos.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 14/03/2020 14:02, Dario Lesca via samba-technical wrote:
> Il giorno lun, 09/03/2020 alle 12.07 +0200, Alexander Bokovoy via
> samba-technical ha scritto:
>> I think it is a missing feature in samba_dlz
> Someone can confirm or deny this affirmation ?
>
> I'm looking for the reason why, when I join a new PC to domain, the PC
> name is insert only into Computers session, and not into DNS zone
> managed from samba AD.
>
> This happened for my wrong configuration (if yes, i can post all my
> configurations)?
>
> Or it's a not implemented yet feature, like Alexander Bokovoy say
>
I don't think it matters if the feature is missing (as Alexander says) 
or not,  the Computers A record should be added the first time Samba is 
run. Starting Samba should cause samba_dnsupdate to run, this uses a 
file called dns_update_list and right at the top of that is this:

# this is a list of DNS entries which will be put into DNS using
# dynamic DNS update. It is processed by the samba_dnsupdate script
A ${HOSTNAME}                                           $IP
AAAA ${HOSTNAME}                                           $IP

 From my reading, it is this that should add the record if it is missing.

Rowland



