Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5B5532C9B
	for <lists+samba-technical@lfdr.de>; Tue, 24 May 2022 16:53:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/gF3sjYUX3MV/zUXfnLuFDSgozNmj3jbjLwmlZ03cUU=; b=PbPKL1ZXp8p/ejDq98dhFWmmYb
	MXpNbtUQkRwLNXEdpDgLfVehNWspku1LDSw08wYMCLe9QP2DGAEhx/0pDxIMG8NwfTdCQaPPeOIUu
	3pgS5qJ8oml1QiPhDd5Yqw1Qz66mqwo/Mr4NvlC6q42hvFLfVVuDIHrunE7cByuHNJpex14kotR4G
	5l7TfV/pwQXnZu1DrQrU2kmDPHUz0NBCto0QOFOZJsMMISXknadmvFPOWQXNdp8KaflEsqFJRVkcR
	wwkALifq/M1u8KBdkb0KMbUxe1FGLuc3iffNdk1wBnkoGr2bDmzDkn0bCFp/qV6fHq3PYKfKLafvM
	S/KbIKkQ==;
Received: from ip6-localhost ([::1]:26720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ntVti-002h7U-Tt; Tue, 24 May 2022 14:52:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61764) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ntVte-002h7L-6w
 for samba-technical@lists.samba.org; Tue, 24 May 2022 14:52:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=/gF3sjYUX3MV/zUXfnLuFDSgozNmj3jbjLwmlZ03cUU=; b=pwutJZYIQSwma4wJTVqUjokMgw
 FdTZWk6jrFbmTl/lUmslpdqBt6iJaRQ4Fc9PCfMetEayqA0W1relRoJ8aUPKd/f000uYWuwP78pVl
 94+gEmNEWRKsGtZtkbP8NhG3KjI9qcg62LC+mYCSyCypcfR/gu2OL06CH9AylLDTOtoCIBn4wse8+
 5f3AzmO3phwwjtRkyeKpbaaEWVPVbbecnbUPo2El/lfQHfzNocg1FaNDZEJB+6qmHMh2NN3S9l6kA
 ovLGiBMFDY1/ipMnzh9GSNLM/1OijETsfM/o2vhcdHtDGSdJc9L9bwQiCsUybHSfrCxi7pQCYdAyG
 IQ/9wg36cHQKUxqaKJQSDZcsuxeopWTEVfVFQAHWVLptUgp1Nav6DEHj7+Qm+1qWXBUcqWy5oQWcW
 EE0FsVtfyB91ABUDZQNLEv6+TLuALkZ75Lh8JaupK5ZSunabCsXknK3HmuWo7M8x9qv4eGSAxf2QA
 J6K68pRMOsBLh+hd9R8xZZ/o;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ntVtd-002Ick-B6; Tue, 24 May 2022 14:52:29 +0000
Date: Tue, 24 May 2022 17:52:28 +0300
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: samba-tool domain join segfaults (4.16)
Message-ID: <YozxLBPyXyggOMIE@pinega.vda.li>
References: <ba1a680e-f971-1306-ecd0-4d52520ce7e2@msgid.tls.msk.ru>
 <5f1b93c0-6a44-20e7-01d9-2ed604ad3c88@msgid.tls.msk.ru>
 <c4fc41ee-38a4-eb63-5db5-c217654f6a2c@msgid.tls.msk.ru>
 <YozrhUpQK9eLuovA@pinega.vda.li>
 <879ec765-7238-e0ef-fe81-d8599101448b@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <879ec765-7238-e0ef-fe81-d8599101448b@msgid.tls.msk.ru>
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
Cc: David Mulder <dmulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ti, 24 touko 2022, Michael Tokarev via samba-technical wrote:
> 24.05.2022 17:28, Alexander Bokovoy wrote:
> ..
> > > But I wonder about in.debug field, - I'm not sure where this
> > > struct is defined..
> > 
> > It is defined in the libnet_join's IDL file: source3/librpc/idl/libnet_join.idl
> > 
> >                  [in] boolean8 debug,
> > 
> > and boolean8 gets translated to uint8_t in the generated C code.
> > 
> > Since Python API really needs 'int' there, we need to use local int
> > variable and copy its value to &r->in.<variable>. I wonder if other
> > places are affected as well.
> 
> Yeah. I already created the MR for this, - using local vars here and in
> another function: https://gitlab.com/samba-team/samba/-/merge_requests/2544

Thanks. It looks good to me, we need to run pipelines, though. I cannot
trigger one for you, for whatever reasons...

-- 
/ Alexander Bokovoy

