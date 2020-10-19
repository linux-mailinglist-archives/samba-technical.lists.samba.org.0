Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A66129284A
	for <lists+samba-technical@lfdr.de>; Mon, 19 Oct 2020 15:38:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=NV8fjx6ooUo3so4S9mQHnToUwbq9oCul0p8iu5BjmrI=; b=RvwarBKELHDQTcPKBv3fuQcAaw
	ojCzKtmtQB2eTprzxVtvCo3RVPS3F/wISViuCKqL6P6q1FI+AJJyt+d9z8UFg/mC5Qrx79OoCcd8q
	a+0d8XjWnWoGDEyjhq9z99WUQQ2xQYM3hP+hBxp+9PrlC3F37wW3reVIIR7Xq0edANXRJYsGOQCP6
	JEncE7fabR8fuHwCrl5NgNVLxoX1KEyPOO9U1UgMoMNGTVP7jI9EzhqzyF4XXcZvbs0EDO9Da363L
	s0xVbzid9W+5AgOEjtlruIccqcnoVD3YIt43zVBUi2mPRdxiLF+bkMDtQLNKQ2QtC3Nlc33e8u6gc
	eyf+JiHg==;
Received: from ip6-localhost ([::1]:44798 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUVLq-00CidQ-Ja; Mon, 19 Oct 2020 13:37:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55986) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUVLm-00CidJ-1f
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 13:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=NV8fjx6ooUo3so4S9mQHnToUwbq9oCul0p8iu5BjmrI=; b=Blt9ybXh3Iho1Lp6hLZh3E+Evs
 txYvx7t0zurR5Wzgbzgwmt7p74NtbBRvbDT5mfg8VwaCjawC8WREjnTI/7xu1tD2wPxFGNpgfjbZV
 5GMqVWsvvz7YYpbmvpHiVeG+vZO4Kt3GFD3qynKkvHuerOSuuTG1cGho+oXwq7DIjypEt1Y5yKusY
 MnEUPPYIa6hASgxBri52a2hvaaj+eXRg7kZU3ISVIZRsxV+RMXMCYtS+1RlcPNmBQyillT1gVnN/Z
 z2l3diAXrb8FxP7Sp5zX2O6PfrJY28H66+GuZc0Gjq5ZeyF0x+sJBXKbqD+jxlrIeDoXYj5jAnunp
 FiiAGCDUTG3Hsv/HVcDBRHXOYhHEQ2QchROMuByQm+/07iY+xedA11glYwf450ioSDcSxBh+MDO2i
 niB8aW/ONs5PL6ovCEqTkA+XGC4U/FRjaGQMwGhTs8jMqvlV2cctfPWW+jqvmwEpXK5JBBvuSMbGL
 Wc6mMApFyVeogjaoLJexD+di;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUVLk-0004HW-9S; Mon, 19 Oct 2020 13:37:20 +0000
Date: Mon, 19 Oct 2020 16:37:18 +0300
To: Rowland penny <rpenny@samba.org>
Subject: Re: dns.keytab file
Message-ID: <20201019133718.GB2164739@pinega.vda.li>
References: <e459994f-01f1-afc6-eb21-7f639f96bf82@kania-online.de>
 <7330647068a853703f694614e3bdef55978d69cd.camel@samba.org>
 <402fbc72-ea2d-53c0-d8f1-56512aed4f1d@kania-online.de>
 <ae44fa9c9693748b66725fda82d0dcfcb78f9484.camel@samba.org>
 <7214e13f-009e-5022-cd93-b7f0468c87a7@kania-online.de>
 <37aabade-4f82-1783-7cd3-53fc12c48308@samba.org>
 <20201019124659.GA2164739@pinega.vda.li>
 <557b55d5-e818-4f7f-5b6c-0b61f27f47b7@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <557b55d5-e818-4f7f-5b6c-0b61f27f47b7@samba.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ma, 19 loka 2020, Rowland penny via samba-technical wrote:
> On 19/10/2020 13:46, Alexander Bokovoy wrote:
> > On ma, 19 loka 2020, Rowland penny via samba-technical wrote:
> > > On 19/10/2020 13:07, Stefan Kania via samba-technical wrote:
> > > > Am 19.10.20 um 03:38 schrieb Andrew Bartlett:
> > > > > On Sat, 2020-10-17 at 09:47 +0200, Stefan Kania wrote:
> > > > > > Hi Andrew,
> > > > > > 
> > > > > > Am 16.10.20 um 22:37 schrieb Andrew Bartlett:
> > > > > > > I just saw this with a customer yesterday.
> > > > > > I see this every time I setup a new domain, I also wrote it into my
> > > > > > Samba4 book. If it's a bug should I write bugreport?
> > > > > Yes.
> > > > Done
> > > > https://bugzilla.samba.org/show_bug.cgi?id=14535
> > > > I hope I did it right :-)
> > > OK, I 'think' I have tracked this down. During the join, 'setup_bind9_dns'
> > > from sambadns.py is called, this in turn calls 'secretsdb_setup_dns'. This
> > > actually removes any existing 'dns.keytab' from the private and bind-dns
> > > dirs, it then goes on to create the keytab via the commit, but only in the
> > > private dir.
> > > 
> > > Now to consider how to create the keytab in the bind-dns dir, is it that the
> > > incorrect path is being passed ? Or just move it to the correct destination
> > > (does anything rely on the dns.keytab being in the private dir ?), or do
> > > something else ?
> > Looking into source4/dns_server/dlz_bind9.c, it accepts dns.keytba in
> > either path, first checking BIND's path, then Samba's private directory.
> > Since the process runs under BIND user (named:named in Fedora, for
> > example), it wouldn't have access to Samba's private directory.
> > 
> > Our source4/setup/named.txt talks about BIND's path (DNS_KEYTAB_ABS is
> > expanded to use BIND's path):
> > 
> > $ git grep DNS_KEYTAB_ABS
> > python/samba/provision/sambadns.py:            "DNS_KEYTAB_ABS": os.path.join(binddns_dir, keytab_name),
> > source4/setup/named.txt:tkey-gssapi-keytab "${DNS_KEYTAB_ABS}";
> > source4/setup/named.txt:chcon -t named_conf_t ${DNS_KEYTAB_ABS}
> > 
> > The logic was that if you ran Samba set up before 4.8.0,
> > samba_upgradedns script helps to upgrade to a newer setup as explained
> > in 8f2dee256e281c438105689b073f09685f161b16:
> > 
> > commit 8f2dee256e281c438105689b073f09685f161b16
> > Author: Andreas Schneider <asn@samba.org>
> > Date:   Thu Aug 10 15:37:54 2017 +0200
> > 
> >      python:samba: Use 'binddns dir' in samba-tool and samba_upgradedns
> > 
> >      This provisions the bind_dlz files in the 'binddns dir'. If you want to
> >      migrate to the new files strcuture you can run samba_upgradedns!
> > 
> >      BUG: https://bugzilla.samba.org/show_bug.cgi?id=12957
> > 
> > So I think the right path is BIND's path.
> > 
> > 
> On a new DC joined using BIND9_DLZ, the dns.keytab does not get created in
> the bind-dns dir, it is created in the private dir, so I think what you are
> saying is that the wrong path is being passed to 'secretsdb_setup_dns' ?

When we run 'provision()', it creates secrets.ldb and committing that to
disk will create dns.keytab, with the help of LDB's update_keytab
module. The provision code actually has the logic to create links from
Samba's private directory's dns.keytab to BIND's directory:

    # Now commit the secrets.ldb to disk
    secrets_ldb.transaction_commit()

    # the commit creates the dns.keytab in the private directory
    private_dns_keytab_path = os.path.join(paths.private_dir, paths.dns_keytab)
    bind_dns_keytab_path = os.path.join(paths.binddns_dir, paths.dns_keytab)

    if os.path.isfile(private_dns_keytab_path):
        if os.path.isfile(bind_dns_keytab_path):
            try:
                os.unlink(bind_dns_keytab_path)
            except OSError as e:
                logger.error("Failed to remove %s: %s" %
                             (bind_dns_keytab_path, e.strerror))

        # link the dns.keytab to the bind-dns directory
        try:
            os.link(private_dns_keytab_path, bind_dns_keytab_path)
        except OSError as e:
            logger.error("Failed to create link %s -> %s: %s" %
                         (private_dns_keytab_path, bind_dns_keytab_path, e.strerror))


So I think there are two areas to look:

 - something removes this link, leaving BIND's path without dns.keytab

 - the link is not enough to access the dns.keytab in Samba's private
   directory

I think we probably should instead move private version of the keytab to
BIND's location which means we could probably achieve that by forcing  
secretsdb_setup_dns() to use that path as 'DNS_KEYTAB' value when
importing secrets_dns.ldif. However, this also means that samba
provisioning code should run under privileges that would allow it to
write into BIND's directory. This is probably fine as we run it as root
already.

-- 
/ Alexander Bokovoy

