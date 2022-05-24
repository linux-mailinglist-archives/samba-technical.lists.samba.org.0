Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 085CB532C2F
	for <lists+samba-technical@lfdr.de>; Tue, 24 May 2022 16:28:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=6p55GvciiX/qiqUImUmBl+OpJmlaPR5LI8JmgLA+c/8=; b=HKsHP+5TfNvCcyqbp0klmjNNN0
	YLQ5zoZNc8x6i8aD5m8902M4caeClC0J2iWkLTvcvWCYs7zhaDk+v81Ia7RDsyyulnMF+7nYKGeLV
	jMvDREyVDrrSscHkKQy6i2IMJSHEkeZIQpUI0XbTSLRtSY47PNvoi8FW7vRXklXYTgfmWsVKP6Ygz
	e5Ygx9N9vVM/reChjAI06hVciatnzsjigVt0yK7oH7CRW67eh3V/0yOh2sj9O5SOd8/8b04g0DmsG
	TcJnV8CYKTEYi+HtSvK+PsrK8YRjDiDuuJrJWIZHhLLHJXZ3Z+qmf/jsgCL6bSR/D3gKNDpmbIGPb
	6OAj16eg==;
Received: from ip6-localhost ([::1]:25416 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ntVWO-002gVV-OM; Tue, 24 May 2022 14:28:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61762) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ntVWJ-002gVM-St
 for samba-technical@lists.samba.org; Tue, 24 May 2022 14:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=6p55GvciiX/qiqUImUmBl+OpJmlaPR5LI8JmgLA+c/8=; b=BylYNIRvhBiiitKE05iNv/JhjO
 +SCaBR30mHl4wSsf4RpTKEyCJb+A69D63jf7CVAfN3ToR5a6RG7Qom+JUtXI3OseODUYcsjUzHL3c
 DRITxbbtFqOvaoSnCeuGLO2mPUqytmyU+ZjPKcscVWGvVTvrWmVr+2COrInpZpvJOVJJ+2Q5L1edA
 nHbSn8zXwrH/NWtEom8yGZ7LV/p9ALX+cQksBkB/bc/KC0ylk0j5DSUCeKszOo1VVO22qjQKb6eQ+
 u4RsWeGBOMzCl38rCukltBTWHEOMH0t9NU17UJLB5ihPWBbTJLW9LCi54hVRDEaQ/ZxFUUU3f+BR7
 +QREobwYdesujMNeSlhvnct7JkNpDp12BRrLIkl54eNLdGPMzAqtsKNeGpGpXqht2AmhJ4hhVIy0K
 zo0CIqgKNa3iR3Z7wOw/pbZ6FAeDTUpGEwFVOPvKoGYOevp5PZ4Vtmmu7ByGYPiEY+g/nd/3PxEOC
 dzzQUTG3p+KkU8yI1pP9q+fN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ntVWJ-002IQV-5J; Tue, 24 May 2022 14:28:23 +0000
Date: Tue, 24 May 2022 17:28:21 +0300
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: samba-tool domain join segfaults (4.16)
Message-ID: <YozrhUpQK9eLuovA@pinega.vda.li>
References: <ba1a680e-f971-1306-ecd0-4d52520ce7e2@msgid.tls.msk.ru>
 <5f1b93c0-6a44-20e7-01d9-2ed604ad3c88@msgid.tls.msk.ru>
 <c4fc41ee-38a4-eb63-5db5-c217654f6a2c@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4fc41ee-38a4-eb63-5db5-c217654f6a2c@msgid.tls.msk.ru>
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
> [Cc'ing David Mulder]
> 
> 24.05.2022 16:07, Michael Tokarev via samba-technical wrote:
> > 24.05.2022 15:52, Michael Tokarev via samba-technical wrote:
> > > Hi!
> > > 
> > > I'm facing a segfault in samba-tool when doing domain join, in
> > > source3/utils/py_net.c py_net_join_member(). Here it is (with some
> > > omissions for brevity):
> > > 
> > > static PyObject *py_net_join_member(py_net_Object *self, PyObject *args, PyObject *kwargs)
> > > {
> > >          struct libnet_JoinCtx *r = NULL;
> > >          uint8_t no_dns_updates;
> > > ...
> > 
> > gdb) p &r
> > $1 = (struct libnet_JoinCtx **) 0x7fffffffd7b8
> > (gdb) p &no_dns_updates
> > $2 = (uint8_t *) 0x7fffffffd7b7 ""
> > 
> > >          if (!PyArg_ParseTupleAndKeywords(args, kwargs, "|sssssszpp:Join",
> > >                                           discard_const_p(char *, kwnames),
> > >                                           &r->in.dnshostname,
> > >                                           &r->in.upn,
> > >                                           &r->in.account_ou,
> > >                                           &r->in.os_name,
> > >                                           &r->in.os_version,
> > >                                           &r->in.os_servicepack,
> > >                                           &r->in.machine_password,
> > >                                           &r->in.debug,
> > >                                           &no_dns_updates)) {
> > 
> > It looks like when PyArg_ParseTupleAndKeywords() is setting no_dns_updates,
> > it does more than single byte, affecting the value of r too. Note the
> > addresses of the two - r is right on the next byte after no_dns_updates.
> 
> And according to https://docs.python.org/3/c-api/arg.html , 'p' arg
> of PyArg_ParseTupleAndKeywords() expects an argument of type int, not
> [unsigned] char.
> 
> And indeed, this change:
> 
> diff --git a/source3/utils/py_net.c b/source3/utils/py_net.c
> index 0d774bcb805..c331bf30db4 100644
> --- a/source3/utils/py_net.c
> +++ b/source3/utils/py_net.c
> @@ -71 +71 @@ static PyObject *py_net_join_member(py_net_Object *self, PyObject *args, PyObjec
> -       uint8_t no_dns_updates;
> +       int no_dns_updates;
> 
> fixes the segfault and makes samba-tool domain join work.
> 
> But I wonder about in.debug field, - I'm not sure where this
> struct is defined..

It is defined in the libnet_join's IDL file: source3/librpc/idl/libnet_join.idl

                [in] boolean8 debug,

and boolean8 gets translated to uint8_t in the generated C code.

Since Python API really needs 'int' there, we need to use local int
variable and copy its value to &r->in.<variable>. I wonder if other
places are affected as well.

-- 
/ Alexander Bokovoy

