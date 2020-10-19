Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 833D429279F
	for <lists+samba-technical@lfdr.de>; Mon, 19 Oct 2020 14:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=kGpxbBvKGWBqGE2hiXUI/kaKf4SJLEcdP2wjzWttJSE=; b=GyXEoQv6Q08f7jJ0P4n+BPpw5u
	XM1rR3YCoFB8OZaAKzzS3P+0aU01s37Uj6InZTxAyKFVaY7VNDaT7N/VyIiM+ovwQo+7G5OU4rLIA
	BnoQumvGsYqWFU7iV6gPtUFaziohXNZL6rk1C7wg7F0Uh4pq+64kf7ts4OrdklVrx48BxWAujueJO
	KIPD7UKU6VpEV4EZ3gFzzY1C9GesiNB8wf6MKtLsDiXUbFC293/JWF3/zxdsX1bnaN5tKqQdfIVsi
	XObcvtBKSJ/SdnXEukproQQWKhps7bIpffhQEUztPZNJOnDV0UQe99tFIDDxKV4BiZehpiD8Ryt05
	pYVvKcUw==;
Received: from ip6-localhost ([::1]:43324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUUZB-00CiNY-Ar; Mon, 19 Oct 2020 12:47:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39478) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUUZ6-00CiNR-BO
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 12:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=kGpxbBvKGWBqGE2hiXUI/kaKf4SJLEcdP2wjzWttJSE=; b=JDAXMT8ieiJ/RS4yI8+16nWhUB
 motyJeWoT/fmUGJIHOfm4T6FBukS0lt8/iPoyMnIZ7fS9S8o0nI0JX5xg64FLxkIhX8m+HyWTkapZ
 iDA/MwpkEMs7TEZ9dHG9FzPUKA+X9bRz71ArMrSijW9vTJQostsCZTfaKe2e9nMxGyaaonMLY2lO4
 2k5b4PILhyMS2eKVUlvd4iPNRPkHPd4v65aM9Hyck2P+bGxAd5xE/OEgRVscda8IQIuWkEIhaN4DH
 imBAoOio0dGRoh4sceEG6NciHkNhaujVBw6u3hU/nmDZUbdKsLaMrBanf7Hek1uf5Dn14n5ZRTDkq
 hmbBepDa/ovb4zlwKvsZRxA+t6/LmyMRLVrZEKLH5pRbqbqdfZdYVgBZUd/8YeWaquobUYnll35YU
 gsZjFPKt4RoWcnDYZwMtyCwBDF8Hntjwx8AGgXJgU7rYwkoFxjwsJ/lvBhfsQ0kX/fqiAwL2LQbbJ
 tEQtOesVcmYyOTvM4tGTOAv8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUUZ5-0003v8-FA; Mon, 19 Oct 2020 12:47:03 +0000
Date: Mon, 19 Oct 2020 15:46:59 +0300
To: Rowland penny <rpenny@samba.org>
Subject: Re: dns.keytab file
Message-ID: <20201019124659.GA2164739@pinega.vda.li>
References: <e459994f-01f1-afc6-eb21-7f639f96bf82@kania-online.de>
 <7330647068a853703f694614e3bdef55978d69cd.camel@samba.org>
 <402fbc72-ea2d-53c0-d8f1-56512aed4f1d@kania-online.de>
 <ae44fa9c9693748b66725fda82d0dcfcb78f9484.camel@samba.org>
 <7214e13f-009e-5022-cd93-b7f0468c87a7@kania-online.de>
 <37aabade-4f82-1783-7cd3-53fc12c48308@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37aabade-4f82-1783-7cd3-53fc12c48308@samba.org>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ma, 19 loka 2020, Rowland penny via samba-technical wrote:
> On 19/10/2020 13:07, Stefan Kania via samba-technical wrote:
> > 
> > Am 19.10.20 um 03:38 schrieb Andrew Bartlett:
> > > On Sat, 2020-10-17 at 09:47 +0200, Stefan Kania wrote:
> > > > Hi Andrew,
> > > > 
> > > > Am 16.10.20 um 22:37 schrieb Andrew Bartlett:
> > > > > I just saw this with a customer yesterday.
> > > > I see this every time I setup a new domain, I also wrote it into my
> > > > Samba4 book. If it's a bug should I write bugreport?
> > > Yes.
> > Done
> > https://bugzilla.samba.org/show_bug.cgi?id=14535
> > I hope I did it right :-)
> 
> OK, I 'think' I have tracked this down. During the join, 'setup_bind9_dns'
> from sambadns.py is called, this in turn calls 'secretsdb_setup_dns'. This
> actually removes any existing 'dns.keytab' from the private and bind-dns
> dirs, it then goes on to create the keytab via the commit, but only in the
> private dir.
> 
> Now to consider how to create the keytab in the bind-dns dir, is it that the
> incorrect path is being passed ? Or just move it to the correct destination
> (does anything rely on the dns.keytab being in the private dir ?), or do
> something else ?

Looking into source4/dns_server/dlz_bind9.c, it accepts dns.keytba in
either path, first checking BIND's path, then Samba's private directory.
Since the process runs under BIND user (named:named in Fedora, for
example), it wouldn't have access to Samba's private directory.

Our source4/setup/named.txt talks about BIND's path (DNS_KEYTAB_ABS is
expanded to use BIND's path):

$ git grep DNS_KEYTAB_ABS
python/samba/provision/sambadns.py:            "DNS_KEYTAB_ABS": os.path.join(binddns_dir, keytab_name),
source4/setup/named.txt:tkey-gssapi-keytab "${DNS_KEYTAB_ABS}";
source4/setup/named.txt:chcon -t named_conf_t ${DNS_KEYTAB_ABS}

The logic was that if you ran Samba set up before 4.8.0,
samba_upgradedns script helps to upgrade to a newer setup as explained
in 8f2dee256e281c438105689b073f09685f161b16:

commit 8f2dee256e281c438105689b073f09685f161b16
Author: Andreas Schneider <asn@samba.org>
Date:   Thu Aug 10 15:37:54 2017 +0200

    python:samba: Use 'binddns dir' in samba-tool and samba_upgradedns

    This provisions the bind_dlz files in the 'binddns dir'. If you want to
    migrate to the new files strcuture you can run samba_upgradedns!

    BUG: https://bugzilla.samba.org/show_bug.cgi?id=12957

So I think the right path is BIND's path.


-- 
/ Alexander Bokovoy

