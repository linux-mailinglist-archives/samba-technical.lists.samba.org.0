Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9AF185AC8
	for <lists+samba-technical@lfdr.de>; Sun, 15 Mar 2020 07:42:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gCbOUDK+8YznUs1iejqGPOYOdU+qbO7rLdPnNnct0Mw=; b=xlFKv8nEpW5BJ8LvwEDCdsPmcc
	YsLY2x35qmsg1ofgCP4Q+lK9YKQJzpSFGeAWY+82qbjld0HwHS2SuOIkeAbPt6dJSM3226Nd29C+x
	QbgR/RSr2Xjg4o5/MewloDk60A1C6QqqKRoFEyQEKu9Cwz60D/gPPIUF9p1qpMLXRgMMteXFySaox
	9cy8z5XntsJF+OteWv614YJJv0JnNxfSmjEY8BAOm/CN6iBnbWXpx6PhR3yFh4RLiYYWn2zSUsej/
	D1hOzuCd5ekYLRN6KatmZii1ENc/ZuH2d5/hzdwOtInCwzOnKf6zhcgLePiyceEXxACV4rWqEcjK3
	qc7YMuiw==;
Received: from ip6-localhost ([::1]:23214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jDMxZ-00G9n7-2W; Sun, 15 Mar 2020 06:41:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25838) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDMxF-00G9n0-Fy
 for samba-technical@lists.samba.org; Sun, 15 Mar 2020 06:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=gCbOUDK+8YznUs1iejqGPOYOdU+qbO7rLdPnNnct0Mw=; b=fFNuH8cvzbzMBNnH/ifWLn6DzA
 B5trJvpju0T340JyElSEspIUKnBxCvs6iGsniZCIzHFXQAO6W0QhlLlpeX8mcRV6Zepln+uh60tbh
 DWNTqQdUnL5EHillEgwwFEwp93jbuUxWdzWLD+sHDnyC5Bi4LPLFdLlTqBOnRGCK9COYNCX03QPVC
 pYOy2a7hiL6e1obkCcXty5N9+1JtuTZwByYuBKoLL/LmRyGy33EJ+kYpYnTLEF/sNr3pxnywrE89p
 RNghHJTVtE+kVC0PPxSvjzDmfF9RcKs5bIuJ6Q3Kj28xXGOKFMLCaj42FzZp9Mah670HkwaKBilvs
 WmAyNPJIyzmf9zb0818tVMkEISrx+DvCdrQu8hM5zuM8qVeJM8+zfrtnoDSaeY2E2ieLwhxuM336+
 eNDNl7v0bd8RJP6G3J3SSVBDy1beCAkE/ertLQSEE0du+HZ+61r3OXi6cC4iJpiTd+PPnmn+x/G5u
 Y4vEjtAu809fAYyu3lRr/g6X;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDMxC-0006It-0g; Sun, 15 Mar 2020 06:40:54 +0000
Date: Sun, 15 Mar 2020 08:40:50 +0200
To: Rowland penny <rpenny@samba.org>
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
Message-ID: <20200315064050.GR2735275@onega.vda.li>
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
 <20200309100715.GK2735275@onega.vda.li>
 <dad25a37497ed4d4b70829925da512b3abb4eb39.camel@solinos.it>
 <52a0f365-579c-5adc-a470-7cf543a0c868@samba.org>
 <2ee4998776b6d690b9f458cdfca7c11626e86784.camel@solinos.it>
 <1e12e848-3540-7651-8712-752600680296@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e12e848-3540-7651-8712-752600680296@samba.org>
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

On la, 14 maalis 2020, Rowland penny via samba-technical wrote:
> On 14/03/2020 15:23, Dario Lesca via samba-technical wrote:
> > Il giorno sab, 14/03/2020 alle 14.15 +0000, Rowland penny via samba-
> > technical ha scritto:
> > 
> > Thanks Rowland, forgive me if I can't understand, but...
> > 
> > > the Computers A record should be added the first  time Samba is
> > > run.
> > The A record is added into DNS zone only "first time Samba is run"
> > or also whenever when I join a Computer to domain ?
> Both ;-), the record should be added when you join a Samba DC, but if it
> isn't, then samba_dnsupdate should add it the first time Samba is run on a
> DC.

samba_dnsupdate calls either nsupdate or samba-tool internally.
Alternatively, it supports using existing text file for DNS entries.
nsupdate relies on DNS server ability to dynamically update zones. Since
Samba bind_dlz implementation does not provide ACLs support for the
zones it manages, dynamically updating those zones does not work, as I
said in the beginning. It is a Samba's problem.

We do not test real dnsupdate use in autotest because we unconditionally
specify --use-dns-faking in selftest/wscript:cmd_testonly(). It results
in passing --use-dns-faking to selftest/selftest.pl and that leads in
setting SAMBA_DNS_FAKING=1 when provisioning AD DCs environments. As
result, selftest/target/Samba4.pm will pass '--use-file' to
samba_dnsupdate instead of forcing it to use nsupdate or samba-tool.

        if ($ENV{SAMBA_DNS_FAKING}) {
                $ctx->{dns_host_file} = "$ENV{SELFTEST_PREFIX}/dns_host_file";
                $ctx->{samba_dnsupdate} = "$ENV{SRCDIR_ABS}/source4/scripting/bin/samba_dnsupdate -s $ctx->{smb_conf} --all-interfaces --use-file=$ctx->{dns_host_file}";
                $ctx->{samba_dnsupdate} = $python_cmd .  $ctx->{samba_dnsupdate};
        } else {
                $ctx->{samba_dnsupdate} = "$ENV{SRCDIR_ABS}/source4/scripting/bin/samba_dnsupdate -s $ctx->{smb_conf} --all-interfaces";
                $ctx->{samba_dnsupdate} = $python_cmd .  $ctx->{samba_dnsupdate};
                $ctx->{use_resolv_wrapper} = 1;
        }

When samba_dnsupdate is called with --use-file, it then will skip
calling actual nsupdate:

def call_nsupdate(d, op="add"):
    """call nsupdate for an entry."""
    global ccachename, nsupdate_cmd, krb5conf

    assert(op in ["add", "delete"])

    if opts.use_file is not None:
        if opts.verbose:
            print("Use File instead of nsupdate for %s (%s)" % (d, op))

    ......



> > I have restart Samba many times but none of the missing Computer name
> > present into Samba Computer list are been added into DNS zone
> > 
> > and then, how does it traslate Computer list into DNS, if the IP of
> > computer in Computer list does not exist?
> > 
> > This is my situation:
> > 
> > [root@addc1 ~]# samba-tool computer list
> > WIN10B$
> > ADDC1$
> > centos8$
> > WIN10A$
> > 
> > [root@addc1 ~]# samba-tool dns query \
> > > addc1.fedora.loc fedora.loc @ ALL -Uadministrator
> >   Name=, Records=3, Children=0
> >      SOA: serial=7, refresh=900, retry=600, expire=86400, minttl=3600,
> > ns=addc1.fedora.loc., email=hostmaster.fedora.loc. (flags=600000f0,
> > serial=7, ttl=3600)
> >      NS: addc1.fedora.loc. (flags=600000f0, serial=4, ttl=900)
> >      A: 192.168.122.100 (flags=600000f0, serial=4, ttl=900)
> >    Name=_msdcs, Records=0, Children=0
> >    Name=_sites, Records=0, Children=1
> >    Name=_tcp, Records=0, Children=4
> >    Name=_udp, Records=0, Children=2
> >    Name=addc1, Records=1, Children=0
> >      A: 192.168.122.100 (flags=f0, serial=1, ttl=900)
> >    Name=centos8, Records=1, Children=0
> >      A: 192.168.122.11 (flags=f0, serial=2, ttl=900)
> >    Name=DomainDnsZones, Records=0, Children=2
> >    Name=ForestDnsZones, Records=0, Children=2
> >    Name=test, Records=1, Children=0
> >      A: 192.168.122.33 (flags=f0, serial=5, ttl=3600)
> > 
> > Like you say, win10a and win10b are not present into DNS zone
> 
> Ahh, a Windows DC will not have samba_dnsupdate, you will probably have to
> create the records manually with samba-tool or ADUC
> 
> > What am I doing wrong
> You are using the Fedora packages to provision a DC, it looks like you might
> just have found another reason not use them for a DC ;-)

This is completely unrelated. As I said before, it is issue with
bind_dlz module. Authentication works fine, as witnessed by Dario's
logs. Authorization doesn't work because bind_dlz doesn't provide any
and there is no way to set it up otherwise.




-- 
/ Alexander Bokovoy

