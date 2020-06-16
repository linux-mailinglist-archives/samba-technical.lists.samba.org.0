Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3853D1FAB23
	for <lists+samba-technical@lfdr.de>; Tue, 16 Jun 2020 10:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=AeH2UTRWl0lYMD1Qgs5uAPdkHo+NwXauo3Ul15ihBD0=; b=v1UrwPGP+JQ/REAenDBtqXei6D
	w53zi6vcC7TVKbMJ/ysLmVgspRx17iPLK+AC4xfX+xrIg/ejNMb/D0dr1zU//9CdngY+yAUhTBqRn
	iSXP/rnQZRHJHqSadFswF+APrD1H7Itlc+68c2Ym4SuHJVkbxfT8NhcXvEp7l79nb1WFFCLjmVROG
	GHzru94bKqgANJwqTmkJZuQtOuacWIXuB8wnLqQJFyybt27NXBAmB1qUWmz0hmejiUgkhEgVnjOLR
	PEZqIJzbv+8BgFaHP8S2e1ef4G2Cr/sp7+fVImrKM2dm+XB7+a6S7yd7J5XGx1xaVrSkeK0ArJ+ab
	0Jkp9Dww==;
Received: from localhost ([::1]:61786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jl6vf-000avK-H8; Tue, 16 Jun 2020 08:26:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56410) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jl6vX-000avC-Vi; Tue, 16 Jun 2020 08:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=AeH2UTRWl0lYMD1Qgs5uAPdkHo+NwXauo3Ul15ihBD0=; b=20QoFo7US69sFnSUR/diGV4vyN
 icWYnOS0feizomgdFlaRZaw/+OUxaYjt1FDKUUO9iGY2qsimFzcsUe3wjij4Wt29P7j+tFV2KNsVk
 YsgzqEkHHFh8noGPUgNEYBH81z1FXBZLPHtw/UsMU0R1kcw8xqAnYE+D8fYN8eeeMb1l9YyHW1ffW
 2YbOZJrju5tq5E+AnbApxijzZJUqxkyKazrozV0WgO9HsyAeUBSR6twCR3PuRLn9q6/Rc0MvjRvc7
 HHALXnkXdOcPu/ObhNKqx1bV8zt/wL04TM1MlnlTc52wI3cA5W/U8+qqQkl1xdU+YYn1psCY8gH+5
 XIhHYBCjyqJ7YcuKSUJXlu8WhetWDFXQKbwFqucJzT6rWUIp9tkRb/GNZ+d/ujD5KUcoes2buGjGw
 S6b9hoVopqLk/1kaTqkKlcDVZGOCMx32KSv36XLvHdX9fp5RUJ1OQiFLRv9ISsbu4tY1FZbmDlO+1
 g4lB201tafpPq1kPPgaDM2My;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jl6vW-0003KI-T9; Tue, 16 Jun 2020 08:26:39 +0000
Date: Tue, 16 Jun 2020 11:26:36 +0300
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: deprecate pdb_ldap and "NT4-like" domains in Samba 4.13 to allow
 removal for Samba 4.14 in March 2021?
Message-ID: <20200616082636.GD3036357@onega.vda.li>
References: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
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
Cc: samba@lists.samba.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ti, 16 kesä 2020, Andrew Bartlett via samba-technical wrote:
> With all the recent talk about ldap stacks, I wondered if we could
> discuss deprecating and eventually removing pdb_ldap?
> 
> The reason is that pdb_ldap is primary user of smbldap.  smbldap is in
> turn yet another of our ldap stacks (I have found four so far), in the
> sense that while it uses OpenLDAP under the hood, it replicates with
> libads, ldb and tldap the 'get AD-thing out of an LDAP reply' part.
> 
> I've huffed and puffed about so much over the past little while that
> sometimes it isn't clear what I'm really most frustrated by, but it
> comes down to:
>  - number of LDAP ASN.1 parsers
> and in particular
>  - number of incompatible stacks (structures and helpers) above those
> parsers
> 
> For example, these functions all do the same concept:
>  - smbldap_get_single_attribute
>  - tldap_talloc_single_attribute
>  - ads_pull_string
>  - ldb_msg_find_attr_as_string
> 
> We likewise have the client-side handling for paged searches in:
>  - ldb (paged_searches module)
>  - libads/ldap.c
>  - lib/smbldap.c
>  - tldap
> 
> Of the two, I (perhaps strangely) actually care most about the upper
> 'helper' layer, because it is in this that we encode Samba and AD style
> LDAP on top of LDAP.  If you look around the functions I list there you
> see so much borrowed, but never made common between them.
> 
> -
> 
> The extensive smbldap layer, largely in duplicate with the others, is
> provided for pdb_ldap (and the pdb_nds for Netware, remember that?),
> net sam (for pdb_ldap installations), idmap_ldap and idmap_rfc2307.
> 
> While it would hit a significant number of large and legacy sites that
> still have not made the move the AD, but I wondered if we could
> deprecate pdb_ldap?  
> 
> pdb_ldap has never been automatically tested, and is primarily in
> support of NT4-like domains (which we should deprecate at the same
> time, for consistency).
> 
> Merge work is hard, particularly when the users are untested.  Removing
> smbldap would reduce by one the number of LDAP stacks, and allow us to
> focus on finding a common way forward for ldb, tldap and libads without
> needing to accommodate smbldap as well (presuming that the idmap
> modules can be migrated). 
> 
> What do folks think, can we move on from these features in 2021?
> 
> (To be clear, we won't break stuff actually needed by FreeIPA, but
> individual codepaths might only be available to FreeIPA in some future
> release, or be only in selftest like the NTVFS file server, or be
> passed over the the FreeIPA side of the fence entirely).

What is required from FreeIPA side is a set of operations to provide
implementation of PASSDB interfaces that deal with searches:
 - search users
 - search groups
 - search aliases

These operations aren't implemented in tdbsam so they cannot be tested
in a default setup as of now, this is one of issues I'm planning to
address because we still need to have Samba DCE RPC interfaces used for
NetLogon and SAMR accessible not only for Samba AD deployments and we
should be able to test them properly.

Another requirement comes from the fact that FreeIPA accesses its own
LDAP server over LDAPI protocol over UNIX domain socket on the same
system, using GSS-API authentication.

Right now libldb does not handle LDAPI connection to an LDAP server like
389-ds (openldap libraries do support that without any problem) on
Fedora 32. In fact, that doesn't work for any LDAP/LDAPI url for non-AD
LDAP compatible LDAP server because ldb doesn't have checks for missing
attributes and crashes inside its initialization code.

ldbsearch on Fedora 32 with Samba 4.12, ldb 2.1.3:

# ldbsearch -H ldapi://%2Fvar%2Frun%2Fslapd-IPA-TEST.socket
Segmentation fault (core dumped)

# coredumpctl debug
           PID: 14312 (ldbsearch)
           UID: 0 (root)
           GID: 0 (root)
        Signal: 11 (SEGV)
     Timestamp: Tue 2020-06-16 08:03:57 UTC (8min ago)
  Command Line: ldbsearch -H ldapi://%2Fvar%2Frun%2Fslapd-IPA-TEST.socket
    Executable: /usr/bin/ldbsearch
 Control Group: /user.slice/user-0.slice/session-1.scope
          Unit: session-1.scope
         Slice: user-0.slice
       Session: 1
     Owner UID: 0 (root)
       Boot ID: 30c1480b4a66445695260249204cdcee
    Machine ID: 23515da731974563b0dbd8618404271c
      Hostname: master.ipa.test
       Storage: /var/lib/systemd/coredump/core.ldbsearch.0.30c1480b4a66445695260249204cdcee.14312.1592294637000000000000.lz4
       Message: Process 14312 (ldbsearch) of user 0 dumped core.
                
                Stack trace of thread 14312:
                #0  0x00007f5b62a46f39 __strcasecmp_l_avx (libc.so.6 + 0x15ef39)
                #1  0x00007f5b62b2215e ldb_msg_find_element (libldb.so.2 + 0x1115e)
                #2  0x00007f5b62b22dbd ldb_msg_find_ldb_val (libldb.so.2 + 0x11dbd)
                #3  0x00007f5b62b2331a ldb_msg_find_attr_as_dn (libldb.so.2 + 0x1231a)
                #4  0x00007f5b62b36a7d ldb_set_default_dns (libldb.so.2 + 0x25a7d)
                #5  0x00007f5b62b36bfe ldb_connect (libldb.so.2 + 0x25bfe)
                #6  0x00007f5b62b0bef4 ldb_cmdline_process_internal (libldb-cmdline.so + 0x2ef4)
                #7  0x000055e2ae72e484 main (ldbsearch + 0x1484)
                #8  0x00007f5b6290f042 __libc_start_main (libc.so.6 + 0x27042)
                #9  0x000055e2ae72e62e _start (ldbsearch + 0x162e)

GNU gdb (GDB) Fedora 9.1-5.fc32
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-redhat-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from /usr/bin/ldbsearch...
Reading symbols from /usr/lib/debug/usr/bin/ldbsearch-2.1.3-1.fc32.x86_64.debug...
[New LWP 14312]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib64/libthread_db.so.1".
Core was generated by `ldbsearch -H ldapi://%2Fvar%2Frun%2Fslapd-IPA-TEST.socket'.
Program terminated with signal SIGSEGV, Segmentation fault.
#0  __strcasecmp_l_avx () at ../sysdeps/x86_64/multiarch/strcmp-sse42.S:199
199		movdqu	(%rdi), %xmm1
(gdb) bt full
#0  __strcasecmp_l_avx () at ../sysdeps/x86_64/multiarch/strcmp-sse42.S:199
No locals.
#1  0x00007f5b62b2215e in ldb_msg_find_element (msg=<optimized out>, attr_name=attr_name@entry=0x7f5b62b3d74f "rootDomainNamingContext") at ../../common/ldb_msg.c:52
        i = <optimized out>
#2  0x00007f5b62b22dbd in ldb_msg_find_ldb_val (msg=<optimized out>, attr_name=attr_name@entry=0x7f5b62b3d74f "rootDomainNamingContext") at ../../common/ldb_msg.c:612
        el = <optimized out>
#3  0x00007f5b62b2331a in ldb_msg_find_attr_as_dn (ldb=ldb@entry=0x55e2af0343b0, mem_ctx=mem_ctx@entry=0x55e2af0343b0, msg=<optimized out>, 
    attr_name=attr_name@entry=0x7f5b62b3d74f "rootDomainNamingContext") at ../../common/ldb_msg.c:815
        res_dn = <optimized out>
        v = <optimized out>
#4  0x00007f5b62b36a7d in ldb_set_default_dns (ldb=ldb@entry=0x55e2af0343b0) at ../../common/ldb.c:180
        tmp_ctx = 0x55e2af03c470
        ret = <optimized out>
        res = 0x55e2af03c550
        tmp_dn = 0x0
        attrs = {0x7f5b62b3d74f "rootDomainNamingContext", 0x7f5b62b3d767 "configurationNamingContext", 0x7f5b62b3d782 "schemaNamingContext", 0x7f5b62b3d796 "defaultNamingContext", 0x0}
#5  0x00007f5b62b36bfe in ldb_connect (ldb=ldb@entry=0x55e2af0343b0, url=0x55e2af034d90 "ldapi://%2Fvar%2Frun%2Fslapd-IPA-TEST.socket", flags=flags@entry=64, options=0x0)
    at ../../common/ldb.c:283
        ret = 0
        url2 = <optimized out>
#6  0x00007f5b62b0bef4 in ldb_cmdline_process_internal (ldb=0x55e2af0343b0, argc=<optimized out>, argv=<optimized out>, usage=0x55e2ae72e6f0 <usage>, search=<optimized out>)
    at ../../tools/cmdline.c:305
        ret = 0x55e2af034920
        pc = 0x55e2af0349a0
        num_options = 0
        opt = <optimized out>
        flags = 64
        rc = <optimized out>
        popt_options = <optimized out>
#7  0x000055e2ae72e484 in main (argc=3, argv=0x7ffd32e24568) at ../../tools/ldbsearch.c:307
        ldb = 0x55e2af0343b0
        basedn = 0x0
        attrs = 0x0
        options = <optimized out>
        ret = -1
        expression = 0x55e2ae72f120 "(|(objectClass=*)(distinguishedName=*))"
        mem_ctx = 0x55e2af021300

The crash actually happens in a basic initialize part of ldb and is
exactly same if I specify an LDAP url too:

# ldbsearch -H ldap://`hostname`
Segmentation fault (core dumped)

In the LDAP server log I can see the searches:

LDAPI search:
[16/Jun/2020:08:13:27.110825313 +0000] conn=139 fd=79 slot=79 connection from local to /var/run/slapd-IPA-TEST.socket
[16/Jun/2020:08:13:27.112187352 +0000] conn=139 op=0 SRCH base="" scope=0 filter="(objectClass=*)" attrs="rootdomainnamingcontext configurationnamingcontext schemanamingcontext defaultnamingcontext"
[16/Jun/2020:08:13:27.114176714 +0000] conn=139 op=0 RESULT err=0 tag=101 nentries=1 etime=0.002617861
[16/Jun/2020:08:13:27.525247748 +0000] conn=139 op=-1 fd=79 closed - B1

LDAP search:
[16/Jun/2020:08:15:28.407027866 +0000] conn=140 fd=79 slot=79 connection from IP.AD.DR.ES to IP.AD.DR.ES
[16/Jun/2020:08:15:28.408473254 +0000] conn=140 op=0 SRCH base="" scope=0 filter="(objectClass=*)" attrs="rootdomainnamingcontext configurationnamingcontext schemanamingcontext defaultnamingcontext"
[16/Jun/2020:08:15:28.410683616 +0000] conn=140 op=0 RESULT err=0 tag=101 nentries=1 etime=0.003439788
[16/Jun/2020:08:15:28.787188218 +0000] conn=140 op=-1 fd=79 closed - B1

So, one more requirement is to make libldb first working with any LDAP
server over LDAP/LDAPS/LDAPI protocols, not necessarily requiring the
remote side represents all of AD LDAP schema.


-- 
/ Alexander Bokovoy

