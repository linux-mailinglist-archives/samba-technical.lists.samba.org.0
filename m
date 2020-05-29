Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCAF1E7ACD
	for <lists+samba-technical@lfdr.de>; Fri, 29 May 2020 12:41:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=kONmtKkHnM/7l02YOb7OMD+1W6WTunzIk79zP/77Yes=; b=w1MZrIlnayLOFNri/RxoeNGvzw
	mxRu2mOW7BVfUOKerAVaxT7ww8nU8qQMOL9HHx1v84T5DpYt/GfRPMiUdZs0SxtMFUPS+ZXVqc+kD
	vioj0xuHqji9g6WwcO57EyYj2BhaCbN15G2GyJFvX4R0J6LmpEkjti/ABn+gW+vKedq21gQthr27/
	v6Qt4zXD0H4AW+/ptqMNCpXTQSt7IQ7hTSeOa+aT4wwfxI0EljetjdsWyanSzlaKNIxtiBd0R4g32
	WlOYLskVYZLKl7BVv+MnRrBVy70WAqGjXU/EVByRwY82co4W7WS8ujZlVSC5JX6Hz7LEka2EEXcBv
	cMbrRs/Q==;
Received: from localhost ([::1]:64856 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jecRX-006KgR-Lf; Fri, 29 May 2020 10:40:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39010) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jecRQ-006KgK-Vj
 for samba-technical@lists.samba.org; Fri, 29 May 2020 10:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=kONmtKkHnM/7l02YOb7OMD+1W6WTunzIk79zP/77Yes=; b=OTWRThoNimmIszxCtXx8XxxP8a
 x+lAvG5/NLD/7tER+WTxxZSMoD7Y1aXGzOAR/fzgTxWheMSBXBp8rYsgm5VZtvXlb7g9TMNizftzN
 pZ8ltnVTBaySC9eT6qXlY5QTugFjhyb/1X8+cnjC97iIoeouK/vmwq4y40GCILdD/ezZEeqWOQJFB
 HL/uy6mwxsUM47EWi1ZLrB2XQTRTKBFNQfbXQOCJHXVk3o+Qyfy9THpFI3q53GEezxGcIkRBaoPsz
 7u93BXUGFRGwf3DROOSxu2R0tW0NaQzLO3OjDn+O2Q4OgvUitK2j3CtK55lAbsPnTmF1umIeOeJZq
 A45VzgP5csVu3dmQgG0Krgctxh9yRERbNVfOU498T4ZRXH6dRFVIVA5Ga/ILU/nHIDtCfTJqt9jvU
 QS0CwMpkzG/FspIOjWcZFmAKaSql6/969vw4NJ7C0gddR+12vuFbAoM2g8/TQnochQD/He9IY921d
 0tNYMsyU0zJApv82U/Vse0fG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jecRQ-0005Rl-Ec; Fri, 29 May 2020 10:40:44 +0000
Date: Fri, 29 May 2020 13:40:42 +0300
To: William Brown <wbrown@suse.de>
Subject: Re: Following Steve's Question - Re Tokens in SPNEGO
Message-ID: <20200529104042.GQ5779@onega.vda.li>
References: <04593936-C78E-43E9-81EE-0311A84D21EB@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04593936-C78E-43E9-81EE-0311A84D21EB@suse.de>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi William,

On pe, 29 touko 2020, William Brown via samba-technical wrote:
> Hi there,
> 
> Thinking to Steve's question yesterday, it would be interesting to
> know from the experts on this mailing list an answer. How what would
> opaque token authentication look like in Samba? How would a passdb
> support this style of authentication? How would a client get the token
> to pass through?
> 
> It would be great to know more about this and explore some of these thoughts. 

My current thinking is around reusing existing infrastructure in the
protocol. SMB3 authenticates with SPNEGO[1]. SPNEGO allows to have multiple
authentication mechanisms advertised, with most common ones being krb5
and NTLM. These are not the only ones, a common extension mechanism
called NEGOEX can be used as well[2].

NEGOEX is basically a way to tunnel some method of authentication known
to both client and server through SPNEGO. It doesn't need need to
require a third party (like KDC) to broker an authenticity of the
parties. MIT Kerberos supports NEGOEX since version 1.18, there are also
patches for Heimdal.

MIT Kerberos has a sample negoex GSSAPI plugin:
https://github.com/krb5/krb5/blob/master/src/plugins/gssapi/negoextest/main.c

It is used within this test:
https://github.com/krb5/krb5/blob/master/src/tests/gssapi/t_negoex.py
which, in turn, runs a very simple GSSAPI application that imports a
target service name, initializes the security context to it using SPNEGO
mechanism and then imitates an application accepting this security
context, all using defaults.

The negoextest plugin implements a simple counter of iterations before
accepting the token as its security context handle -- it is decremented
and then the value is encapsulated into an output token that is passed
back to the application.

On the target application side, when input from a client is accepted by
the negoextest plugin, the plugin unwraps a token and decides whether to
continue ping-ponging with a client by decrementing the token's hops or
completing the exchange.

Nothing in this exchange requires Kerberos KDC to exist. Whatever
gss_init_security_context() / gss_accept_security_context() consider
needed to implement a correct exchange will be accepted by GSSAPI.

We are not limited by the way how gss_accept_security_context()
implementation does its verification of the context but we should
consider how we derive information that Samba needs afterwards: NT
security token. 

Right now we get this information either from MS-PAC record in the
Kerberos ticket or from NTLMSSP negotiation. It is something that NEGOEX
plugin would need to implement so that an application after accepting
the security context would be able to do

  gss_inquire_name(..., &attrs);

  find an attribute with the right name

  gss_get_name_attribute(..., name, attribute, ..., &value, ...);

  extract NT security token or something that can be used to construct
  it from the value with the right name


[1] https://docs.microsoft.com/en-us/openspecs/windows_protocols/MS-SPNG/d2ccb21f-be95-426e-88b3-020bd39158f1
[2] https://docs.microsoft.com/en-us/openspecs/windows_protocols/MS-SPNG/fe1b1adc-07f6-40c0-a36b-b4f75be2695e

-- 
/ Alexander Bokovoy

