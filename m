Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 885052927B4
	for <lists+samba-technical@lfdr.de>; Mon, 19 Oct 2020 14:55:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=WLyAqF6acLv+Qs5Qj/j1Oo8TmfRSI70Ks0iQ+tGTLEc=; b=jshGKjNmCbB8TBkODXQcZHgLhj
	KSDhMJz/wz43Df0cOdsX8EJkcQXNHmq8m1zRxoBi/+Xxeiu8l8sdLgeS5CAesAySMgL3V1gOe1KbV
	sNHSWgtAnv3ydQ2kG5/dgxnpGTl7TPL0ml+kRXA28wlndcchdpq+cM0kWLYh+2pwKPc9LGmUXFOci
	CKNmzp0tQk6zcX4jRFyYpQgKgCw5VmcWY6ISIiurBTkPLEmMc8G+mWFjUMBO2Jk/CKM5ZmyIS6DGZ
	oeV/Pes/79tFmoW2LcGlq/Q3Z5gFVsj0ZuBsV3IMWafTdl/eze+ptBh/R3cNIKmjhv8Tg0wLmsRFN
	5kIWhBKQ==;
Received: from ip6-localhost ([::1]:44050 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUUh2-00CiU3-C4; Mon, 19 Oct 2020 12:55:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42318) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUUgx-00CiTw-VW
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 12:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=WLyAqF6acLv+Qs5Qj/j1Oo8TmfRSI70Ks0iQ+tGTLEc=; b=gvWEfu8VoEs5KrIMq6kcTmOjUM
 XiGt3TJ+ds7wXxs5dvaa8fI6cIndKLUDn8xRWILGVkODUnkV7gds8TzgQbraER3BuLXdO3/5geme2
 M9PgoSof0NI7kjY8Ok0F4BoB2p8kdBBH1U/XQOp2U8qyYsAxvM+TTBDKPQOi08lq3P8YUnWPRIclv
 vTYUIBAUbrSFzCAj+eZe+qDKAicbIEnp+wov122yzXLPhyc6KkQrsxAog1HHuQpdnRkrnhU1HWjBH
 1yPuAdIPicUPYl6C9ZFHXLvGqwZab/mL5aEHacz9pB4RM3eGE8Ht8B0HpktToQxtSrscUxLbPt6XF
 Eir9kyDPHQxaTGLC9bE5yIK+LHykfBt55tbnshZav/izcRFDRG8A5S3uTxoqUbw9HFeE+Sg7bp6Fp
 pBOfk0agVqecBsR1aOIjuJBOk2iEr0mb6X8r2jQaZ1tfh5SxvoK7vPHZlcR8qUdGegqmoJ6b2lDiA
 xiB3oVAMWKTNkiVXGN/gbXUC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUUgx-0003yu-EH
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 12:55:11 +0000
Subject: Re: dns.keytab file
References: <e459994f-01f1-afc6-eb21-7f639f96bf82@kania-online.de>
 <7330647068a853703f694614e3bdef55978d69cd.camel@samba.org>
 <402fbc72-ea2d-53c0-d8f1-56512aed4f1d@kania-online.de>
 <ae44fa9c9693748b66725fda82d0dcfcb78f9484.camel@samba.org>
 <7214e13f-009e-5022-cd93-b7f0468c87a7@kania-online.de>
 <37aabade-4f82-1783-7cd3-53fc12c48308@samba.org>
 <20201019124659.GA2164739@pinega.vda.li>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <557b55d5-e818-4f7f-5b6c-0b61f27f47b7@samba.org>
Date: Mon, 19 Oct 2020 13:55:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201019124659.GA2164739@pinega.vda.li>
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

On 19/10/2020 13:46, Alexander Bokovoy wrote:
> On ma, 19 loka 2020, Rowland penny via samba-technical wrote:
>> On 19/10/2020 13:07, Stefan Kania via samba-technical wrote:
>>> Am 19.10.20 um 03:38 schrieb Andrew Bartlett:
>>>> On Sat, 2020-10-17 at 09:47 +0200, Stefan Kania wrote:
>>>>> Hi Andrew,
>>>>>
>>>>> Am 16.10.20 um 22:37 schrieb Andrew Bartlett:
>>>>>> I just saw this with a customer yesterday.
>>>>> I see this every time I setup a new domain, I also wrote it into my
>>>>> Samba4 book. If it's a bug should I write bugreport?
>>>> Yes.
>>> Done
>>> https://bugzilla.samba.org/show_bug.cgi?id=14535
>>> I hope I did it right :-)
>> OK, I 'think' I have tracked this down. During the join, 'setup_bind9_dns'
>> from sambadns.py is called, this in turn calls 'secretsdb_setup_dns'. This
>> actually removes any existing 'dns.keytab' from the private and bind-dns
>> dirs, it then goes on to create the keytab via the commit, but only in the
>> private dir.
>>
>> Now to consider how to create the keytab in the bind-dns dir, is it that the
>> incorrect path is being passed ? Or just move it to the correct destination
>> (does anything rely on the dns.keytab being in the private dir ?), or do
>> something else ?
> Looking into source4/dns_server/dlz_bind9.c, it accepts dns.keytba in
> either path, first checking BIND's path, then Samba's private directory.
> Since the process runs under BIND user (named:named in Fedora, for
> example), it wouldn't have access to Samba's private directory.
>
> Our source4/setup/named.txt talks about BIND's path (DNS_KEYTAB_ABS is
> expanded to use BIND's path):
>
> $ git grep DNS_KEYTAB_ABS
> python/samba/provision/sambadns.py:            "DNS_KEYTAB_ABS": os.path.join(binddns_dir, keytab_name),
> source4/setup/named.txt:tkey-gssapi-keytab "${DNS_KEYTAB_ABS}";
> source4/setup/named.txt:chcon -t named_conf_t ${DNS_KEYTAB_ABS}
>
> The logic was that if you ran Samba set up before 4.8.0,
> samba_upgradedns script helps to upgrade to a newer setup as explained
> in 8f2dee256e281c438105689b073f09685f161b16:
>
> commit 8f2dee256e281c438105689b073f09685f161b16
> Author: Andreas Schneider <asn@samba.org>
> Date:   Thu Aug 10 15:37:54 2017 +0200
>
>      python:samba: Use 'binddns dir' in samba-tool and samba_upgradedns
>
>      This provisions the bind_dlz files in the 'binddns dir'. If you want to
>      migrate to the new files strcuture you can run samba_upgradedns!
>
>      BUG: https://bugzilla.samba.org/show_bug.cgi?id=12957
>
> So I think the right path is BIND's path.
>
>
On a new DC joined using BIND9_DLZ, the dns.keytab does not get created 
in the bind-dns dir, it is created in the private dir, so I think what 
you are saying is that the wrong path is being passed to 
'secretsdb_setup_dns' ?

Rowland



