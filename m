Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 026FC227A98
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jul 2020 10:24:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=9FfmRtQV1gy/Dy9iDP49iSdYhzGUp4zuYcPWB1OG5Ao=; b=Pt6G+Q/wxWh9rN62BjSpP8rY6Z
	WedzCThq3sI+RZFzKYGxTfWRAggL0BDNyJ1SD/dJYpOPNkhW+kyTXFFeuTNR2CWxLD4+lAL1hECZx
	DqsWKkmDcoqRTRY6uXNJFbE87ZLWh8gI7VexsRtJJWvG8XRdWAoQb62JiiYitUP36BAijO4bgp4OH
	pGW4OfxBuzAHzjmJgJij5BtRvbncXVHvE/5qH2DqNlVeKjee1/If7SspZyOjcZN5rYzCkjEnw5QvH
	+Es7oqlGMC1lDtU8v+YmHcSuNOxIrF6CZZSXODEjt1aQDRMR/5gCC8gMhoHUfRQQuW5yoZusFOZ+o
	+TFKtlQA==;
Received: from localhost ([::1]:50572 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jxnYo-008yse-Vd; Tue, 21 Jul 2020 08:23:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33520) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jxnYi-008ysX-3p
 for samba-technical@lists.samba.org; Tue, 21 Jul 2020 08:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=9FfmRtQV1gy/Dy9iDP49iSdYhzGUp4zuYcPWB1OG5Ao=; b=SmQg4kpAgtlP2zHlyWGtb9N2W2
 Qe9ceJJT26OrYzmTA7rw6J/ZIw8/AGo9qYjCaRurNVEYV76/8wfM1RpQW+9yoAABDliQZYBN2OZDY
 4DyfSSXR0PW5GtrLYd1DFcaGU3qnkRSpmhAr+BOiKNR7WIGJQMpYP1nG2PfS6GZxVWoKsROul/qVj
 XQD+kvpz+N7Whb6TP1ZjFIIv2emg2nGKEJRdI5U41NyAlgYe7zqYm+AMTWonTRRDCTwqp2esL1DF4
 J8c6rhW+WsbAd6OW5rZNKfxM//Ci0MuXlW5vRq9S1MTZc4b74a4GwhseGsNIqRi0q/HsEQH8hWmhO
 8s4x1muG/QrXB0J8Oc/6RTkauZXdQOP9/D/xa4B8SEXWLC7CEIR+2lPnpi49Dac4FwfkcWf4w5R7S
 joIgDtenXS1fcZO7rf4F+33oxs7tFATYkipznD5EdSgzth3JrLP0j8uyMrPjtCErI8LU2L0fQO8GO
 5UqlTAuDDl/mVOJTGFRO2gd3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jxnYh-000360-I6; Tue, 21 Jul 2020 08:23:31 +0000
To: <samba-technical@lists.samba.org>
References: <BY5PR19MB3096D158005BDD10D2A4CF17DE7B0@BY5PR19MB3096.namprd19.prod.outlook.com>
 <39d17620-cef7-7f45-a372-2a3a6d900591@samba.org>
 <BY5PR19MB3096FAF614DA77FC3FB5F9C4DE7B0@BY5PR19MB3096.namprd19.prod.outlook.com>
In-Reply-To: <BY5PR19MB3096FAF614DA77FC3FB5F9C4DE7B0@BY5PR19MB3096.namprd19.prod.outlook.com>
Subject: RE: Samba 4.10.4 - Error loading module nfs4acl_xattr due to
 dependent libraries
Date: Tue, 21 Jul 2020 10:23:31 +0200
Message-ID: <AB6B46A6A3F447D895F47BE94D2760F1@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 11
Thread-Index: AdZeZWKV0/pBpYqlScGFyi/z1rB3JAACIAAAAAk8DNAAKFmbEA==
X-MimeOLE: Produced By Microsoft MimeOLE
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Cc: 'Sandeep Nashikkar' <snashikkar@commvault.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

What did you use as build paramaters? 
I had the same problem, about 1.5 years ago. 

Fix was this commit in debian. 
https://salsa.debian.org/samba-team/samba/commit/247316b0b2fb712c506c461459c
0138f212a9257 

And was nfs-common install prio to the build? So check which packages you
need as build depend. 

I noticed you mentioned yum.. I only do debian (and related) 
But this should give the hint to fix you build. 


Greetz, 

Louis



> -----Oorspronkelijk bericht-----
> Van: samba-technical 
> [mailto:samba-technical-bounces@lists.samba.org] Namens 
> Sandeep Nashikkar via samba-technical
> Verzonden: maandag 20 juli 2020 17:07
> Aan: Ralph Boehme; samba-technical@lists.samba.org
> Onderwerp: RE: Samba 4.10.4 - Error loading module 
> nfs4acl_xattr due to dependent libraries
> 
> > -----Original Message-----
> > From: Ralph Boehme <slow@samba.org> 
> > Sent: Monday, July 20, 2020 1:45 PM
> > To: Sandeep Nashikkar <snashikkar@commvault.com>; 
> samba-technical@lists.samba.org
> > Subject: Re: Samba 4.10.4 - Error loading module 
> nfs4acl_xattr due to dependent libraries
> 
> > Am 7/20/20 um 10:02 AM schrieb Sandeep Nashikkar via 
> samba-technical:
> > > Hello
> > > 
> > > I am trying to load VFS module nfs4acl_xattr which is 
> compiled and linked on Samba 4.10.4 as shared module.
> > > It fails to load with following error:
> > > 
> > >   Error loading module '/usr/lib64/samba/vfs/nfs4acl_xattr.so': 
> > > libgssapi-samba4.so.2: cannot open shared object file: No 
> such file or 
> > > directory
> > > 
> > > I have been using the module compiled with source with 
> samba installed from yum repo till Samba 4.8.3. I did not 
> face this issue before.
> > > Can someone guide me why does it depend on this library 
> and how can I tackle this? Do we need to install another 
> package to fulfill the deps?
> > > 
> > > The libgssapi-samba4 library is not present in standard 
> locations on a setup where we upgrade/install the 
> samba-4.10.4 through yum repository.
> > > Its present in the 
> ./bin/default/source4/heimdal_build/libgssapi-samba4.so when 
> we build the samba for the module itself.
> > > If we provide the LD_LIBRARY_PATH and use LD_DEBUG=libs, 
> we see it loads many libraries with -samba4 suffix from that 
> directory.
> > > 
> > > Do I need to build samba module with a particular 
> configure flag so that these dependencies are not required?
> > > Appreciate any help in advance.
> 
> > whatever pulls in the depedency for libgssapi-samba4.so to 
> nfs4acl_xattr.so... why don't you just package them so 
> they're available at runtime?
> >
> > -slow
> >
> > -- 
> > Ralph Boehme, Samba Team                https://samba.org/
> > Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
> > GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46
> 
> Ralph, 
> 
> I could not find where libgsssapi-samba4 is added in as a dependency. 
> Its built as part of heimdal with below wscript:
> 
> source4/heimdal_build/wscript_build:        bundled_name = 
> libname + '-samba4'
> 
> where libname comes from:
> 
>     HEIMDAL_LIBRARY('gssapi',
>                     HEIMDAL_GSSAPI_SPNEGO_SOURCE + 
> HEIMDAL_GSSAPI_KRB5_SOURCE + '''
> 
> It is not linked explicitly anywhere else as far as I could grep. 
> 
> I see following libs which are required by nfs4acl_xattr module. 
> 
> libgssapi-samba4.so.2
> libroken-samba4.so.19
> libcom_err-samba4.so.0
> libasn1-samba4.so.8
> libkrb5-samba4.so.26
> libz-samba4.so
> libwind-samba4.so.0
> libhcrypto-samba4.so.5
> libhx509-samba4.so.5
> libheimbase-samba4.so.1
> libsmbldaphelper-samba4.so
> 
> Please correct me if I am wrong, but are you asking to bundle 
> and ship all those libs which are referred by 
> nfs4acl_xattr.so module just like libgssapi-samba4?
> 
> Thanks,
> Sandeep
> 


