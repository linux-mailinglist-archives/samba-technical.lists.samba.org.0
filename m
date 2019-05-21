Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F20325AF6
	for <lists+samba-technical@lfdr.de>; Wed, 22 May 2019 01:55:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=KzxEv00btCRSARx+nbRyUESD2CcGf2jlRTj3e/UU+Q8=; b=vP9LoLG6SgwEWlETg8/jjwA2v1
	JhqRKsbmq9mKMGYeVPdGNP8E4Q33olBD2e5tSciJKibqNAejDW6nd47bxqS8dgnUky+I0cYThHNBF
	DULrz2o7qpOJhJq8j80Ws7i4fxcCUfIersr9xulKAmef+ITMrM+SV6Z15sm6H+ogkf1eeK5Vz2esx
	eSfE7FGU6AbSC9wqvPHsmPOzGJHofv/YmWzLhHZAu0KNN8UgqlObXQwr5O4n7dycqnr9ImzeXR812
	jkGwJarov5aiDb+5Lpih+ViJY5SHdcbpZkeTxzHj2B2V36NlqWIZb2+58Y3jykJX3eaQtAIuuWJBj
	Rm8LMyIQ==;
Received: from localhost ([::1]:41114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTEan-001A14-NR; Tue, 21 May 2019 23:54:49 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:40316) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim) id 1hTEag-001A0x-VB
 for samba-technical@lists.samba.org; Tue, 21 May 2019 23:54:46 +0000
Received: from [IPv6:2404:130:0:1000:140:c225:1251:d13f] (unknown
 [IPv6:2404:130:0:1000:140:c225:1251:d13f])
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 785138123B
 for <samba-technical@lists.samba.org>; Wed, 22 May 2019 11:54:23 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=catalyst; t=1558482863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=KzxEv00btCRSARx+nbRyUESD2CcGf2jlRTj3e/UU+Q8=;
 b=OisenD+bpPum8gF/rJ94BBTZ6+z6T8MFLHKsI8u3d9YKRBz3W8tSNCuNndwfcKXdmwr3Y2
 wuFSO7Cy60+Q9InzwJdFvPFIdS4i/wj9Ulxy+aFxOmMrG0IR3RNPVIk4nGHQZ7+L+8GqY/
 Cql5AZamSAaj+nNu5HdjAyEuuv63+q0=
Subject: [PATCH] Re: dcerpc.bare test is a bit flappy
References: <e538c255-9698-0464-f4c1-4116c2ed8c6d@catalyst.net.nz>
 <db3b1be6-b850-3ba5-58b7-1dfb0c5bdb8e@catalyst.net.nz>
To: Samba Technical <samba-technical@lists.samba.org>
Openpgp: preference=signencrypt
Message-ID: <9a39017c-a477-920d-10f6-be01d63c3a31@catalyst.net.nz>
Date: Wed, 22 May 2019 11:54:22 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <db3b1be6-b850-3ba5-58b7-1dfb0c5bdb8e@catalyst.net.nz>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="8pfMVrIaTHINxEQWHosp1dL026CTmJytu"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=catalyst; t=1558482864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=KzxEv00btCRSARx+nbRyUESD2CcGf2jlRTj3e/UU+Q8=;
 b=mz+5gOcJpiGoDKjCwHLc0d/cz+juoHVnBiNdMYsIGYsn+oNJfIFDXxAufsbROXmmsL4sUw
 AT2YIQPTXNa8PX41coCmz1k+5M95C9p1RfrXtn8BH9OIrUOIeet8ye/wikENWLMr+kI6pw
 e4CXuy8s61cX9BA5YwE4mP7F6kt07og=
ARC-Seal: i=1; s=catalyst; d=catalyst.net.nz; t=1558482864; a=rsa-sha256;
 cv=none;
 b=VErE//HhVdjhsCRm4bNGFK+w3m7Tf0iYnu5sGc1AmORcQ2X0Hev8fVF7o17GgP9DOT0fkn
 +JUDrwJ+EkdrhkDNrfQREWf8DEwH2AD2leEt16LjBU5bh8vYrNjAVWcLL2hq2+OsHFz0HL
 b6BCUNhOHp8wFhNyFoWK9Lu8DOIlxVE=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=gary@catalyst.net.nz smtp.mailfrom=gary@catalyst.net.nz
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Gary Lockyer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gary Lockyer <gary@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8pfMVrIaTHINxEQWHosp1dL026CTmJytu
Content-Type: multipart/mixed; boundary="ROTWIyghfqLqvWjTS0vC28HLpxcZ7L1rf";
 protected-headers="v1"
From: Gary Lockyer <gary@catalyst.net.nz>
To: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <9a39017c-a477-920d-10f6-be01d63c3a31@catalyst.net.nz>
Subject: [PATCH] Re: dcerpc.bare test is a bit flappy
References: <e538c255-9698-0464-f4c1-4116c2ed8c6d@catalyst.net.nz>
 <db3b1be6-b850-3ba5-58b7-1dfb0c5bdb8e@catalyst.net.nz>
In-Reply-To: <db3b1be6-b850-3ba5-58b7-1dfb0c5bdb8e@catalyst.net.nz>

--ROTWIyghfqLqvWjTS0vC28HLpxcZ7L1rf
Content-Type: multipart/mixed;
 boundary="------------1F82FEC6CD8F259E6591724A"
Content-Language: en-NZ

This is a multi-part message in MIME format.
--------------1F82FEC6CD8F259E6591724A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Found the issue and have a CI pipeline running
https://gitlab.com/samba-team/devel/samba/pipelines/62499643

patch also attached, swapped the order of the parameters in the
talloc_reparent call.

Ng=C4=81 mihi
Gary



On 21/05/19 16:02, Gary Lockyer via samba-technical wrote:
> I'll take a look at this, probably tomorrow. But running with
> AddressSanitizer enabled I get
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D10844=3D=3DERROR: AddressSanitizer: heap-use-after-free on addres=
s
> 0x612000008920 at pc 0x7f4c173d7a81 bp 0x7ffd153bdea0 sp 0x7ffd153bde90=

> READ of size 8 at 0x612000008920 thread T0
>     #0 0x7f4c173d7a80 in _tevent_schedule_immediate
> ../../lib/tevent/tevent.c:670
>     #1 0x7f4c173dbefc in tevent_req_post ../../lib/tevent/tevent_req.c:=
257
>     #2 0x7f4c120c0a0e in tstream_bsd_disconnect_send
> ../../lib/tsocket/tsocket_bsd.c:2074
>     #3 0x7f4c120badab in tstream_disconnect_send
> ../../lib/tsocket/tsocket.c:771
>     #4 0x7f4c14d84a8a in dcerpc_shutdown_pipe
> ../../source4/librpc/rpc/dcerpc.c:2367
>     #5 0x7f4c14d84a8a in dcerpc_connection_dead
> ../../source4/librpc/rpc/dcerpc.c:872
>     #6 0x7f4c14d84e53 in dcerpc_connection_destructor
> ../../source4/librpc/rpc/dcerpc.c:118
>     #7 0x7f4c17ee80e7 in _tc_free_internal ../../lib/talloc/talloc.c:11=
57
>     #8 0x7f4c17ee80e7 in _tc_free_children_internal
> ../../lib/talloc/talloc.c:1666
>     #9 0x7f4c17ee856d in _tc_free_internal ../../lib/talloc/talloc.c:11=
83
>     #10 0x7f4c17ee856d in _tc_free_children_internal
> ../../lib/talloc/talloc.c:1666
>     #11 0x7f4c17eed0b5 in _tc_free_internal ../../lib/talloc/talloc.c:1=
183
>     #12 0x7f4c17eed0b5 in _talloc_free_internal
> ../../lib/talloc/talloc.c:1247
>     #13 0x7f4c17eed0b5 in _talloc_free ../../lib/talloc/talloc.c:1789
>     #14 0x7f4c063db898 in dcerpc_interface_dealloc
> ../../source4/librpc/rpc/pyrpc.c:322
>     #15 0x5023b4  (/usr/bin/python3.6+0x5023b4)
>     #16 0x502f3c  (/usr/bin/python3.6+0x502f3c)
>     #17 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x5068=
58)
>     #18 0x504c27  (/usr/bin/python3.6+0x504c27)
>     #19 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b=
2d)
>     #20 0x591460  (/usr/bin/python3.6+0x591460)
>     #21 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
>     #22 0x507c16 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x507c=
16)
>     #23 0x504c27  (/usr/bin/python3.6+0x504c27)
>     #24 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b=
2d)
>     #25 0x591460  (/usr/bin/python3.6+0x591460)
>     #26 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
>     #27 0x54d4e1  (/usr/bin/python3.6+0x54d4e1)
>     #28 0x5a730b in _PyObject_FastCallKeywords (/usr/bin/python3.6+0x5a=
730b)
>     #29 0x503072  (/usr/bin/python3.6+0x503072)
>     #30 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x5068=
58)
>     #31 0x504c27  (/usr/bin/python3.6+0x504c27)
>     #32 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b=
2d)
>     #33 0x591460  (/usr/bin/python3.6+0x591460)
>     #34 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
>     #35 0x507c16 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x507c=
16)
>     #36 0x504c27  (/usr/bin/python3.6+0x504c27)
>     #37 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b=
2d)
>     #38 0x591460  (/usr/bin/python3.6+0x591460)
>     #39 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
>     #40 0x54d4e1  (/usr/bin/python3.6+0x54d4e1)
>     #41 0x5a730b in _PyObject_FastCallKeywords (/usr/bin/python3.6+0x5a=
730b)
>     #42 0x503072  (/usr/bin/python3.6+0x503072)
>     #43 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x5068=
58)
>     #44 0x504c27  (/usr/bin/python3.6+0x504c27)
>     #45 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b=
2d)
>     #46 0x591460  (/usr/bin/python3.6+0x591460)
>     #47 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
>     #48 0x507c16 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x507c=
16)
>     #49 0x504c27  (/usr/bin/python3.6+0x504c27)
>     #50 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b=
2d)
>     #51 0x591460  (/usr/bin/python3.6+0x591460)
>     #52 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
>     #53 0x54d4e1  (/usr/bin/python3.6+0x54d4e1)
>     #54 0x5a730b in _PyObject_FastCallKeywords (/usr/bin/python3.6+0x5a=
730b)
>     #55 0x503072  (/usr/bin/python3.6+0x503072)
>     #56 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x5068=
58)
>     #57 0x504c27  (/usr/bin/python3.6+0x504c27)
>     #58 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b=
2d)
>     #59 0x591460  (/usr/bin/python3.6+0x591460)
>     #60 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
>     #61 0x507c16 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x507c=
16)
>     #62 0x504c27  (/usr/bin/python3.6+0x504c27)
>     #63 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b=
2d)
>     #64 0x591460  (/usr/bin/python3.6+0x591460)
>     #65 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
>     #66 0x54d4e1  (/usr/bin/python3.6+0x54d4e1)
>     #67 0x5a730b in _PyObject_FastCallKeywords (/usr/bin/python3.6+0x5a=
730b)
>     #68 0x503072  (/usr/bin/python3.6+0x503072)
>     #69 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x5068=
58)
>     #70 0x502208  (/usr/bin/python3.6+0x502208)
>     #71 0x502f3c  (/usr/bin/python3.6+0x502f3c)
>     #72 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x5068=
58)
>     #73 0x502208  (/usr/bin/python3.6+0x502208)
>     #74 0x502f3c  (/usr/bin/python3.6+0x502f3c)
>     #75 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x5068=
58)
>     #76 0x504c27  (/usr/bin/python3.6+0x504c27)
>     #77 0x501b2d in _PyFunction_FastCallDict (/usr/bin/python3.6+0x501b=
2d)
>     #78 0x591460  (/usr/bin/python3.6+0x591460)
>     #79 0x54b812  (/usr/bin/python3.6+0x54b812)
>     #80 0x555420  (/usr/bin/python3.6+0x555420)
>     #81 0x5a730b in _PyObject_FastCallKeywords (/usr/bin/python3.6+0x5a=
730b)
>     #82 0x503072  (/usr/bin/python3.6+0x503072)
>     #83 0x507640 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x5076=
40)
>     #84 0x504c27  (/usr/bin/python3.6+0x504c27)
>     #85 0x511ec9  (/usr/bin/python3.6+0x511ec9)
>     #86 0x502d6e  (/usr/bin/python3.6+0x502d6e)
>     #87 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x5068=
58)
>     #88 0x504c27  (/usr/bin/python3.6+0x504c27)
>     #89 0x50253f  (/usr/bin/python3.6+0x50253f)
>     #90 0x502f3c  (/usr/bin/python3.6+0x502f3c)
>     #91 0x506858 in _PyEval_EvalFrameDefault (/usr/bin/python3.6+0x5068=
58)
>     #92 0x504c27  (/usr/bin/python3.6+0x504c27)
>     #93 0x58659c  (/usr/bin/python3.6+0x58659c)
>     #94 0x59ebbd in PyObject_Call (/usr/bin/python3.6+0x59ebbd)
>     #95 0x63835a  (/usr/bin/python3.6+0x63835a)
>     #96 0x639027 in Py_Main (/usr/bin/python3.6+0x639027)
>     #97 0x4a6f0f in main (/usr/bin/python3.6+0x4a6f0f)
>     #98 0x7f4c1c66eb96 in __libc_start_main
> (/lib/x86_64-linux-gnu/libc.so.6+0x21b96)
>     #99 0x5afa09 in _start (/usr/bin/python3.6+0x5afa09)
>=20
> 0x612000008920 is located 96 bytes inside of 312-byte region
> [0x6120000088c0,0x6120000089f8)
> freed by thread T0 here:
>     #0 0x7f4c1d38fb40 in free
> (/usr/lib/x86_64-linux-gnu/libasan.so.5+0xedb40)
>     #1 0x7f4c17ee88ab in _tc_free_internal ../../lib/talloc/talloc.c:12=
21
>     #2 0x7f4c17ee88ab in _tc_free_children_internal
> ../../lib/talloc/talloc.c:1666
>     #3 0x7f4c17eed0b5 in _tc_free_internal ../../lib/talloc/talloc.c:11=
83
>     #4 0x7f4c17eed0b5 in _talloc_free_internal
> ../../lib/talloc/talloc.c:1247
>     #5 0x7f4c17eed0b5 in _talloc_free ../../lib/talloc/talloc.c:1789
>     #6 0x7f4c063db898 in dcerpc_interface_dealloc
> ../../source4/librpc/rpc/pyrpc.c:322
>     #7 0x5023b4  (/usr/bin/python3.6+0x5023b4)
>=20
> previously allocated by thread T0 here:
>     #0 0x7f4c1d38ff00 in __interceptor_malloc
> (/usr/lib/x86_64-linux-gnu/libasan.so.5+0xedf00)
>     #1 0x7f4c17ef532c in __talloc_with_prefix ../../lib/talloc/talloc.c=
:782
>     #2 0x7f4c17ef532c in __talloc ../../lib/talloc/talloc.c:824
>     #3 0x7f4c17ef532c in _talloc_named_const ../../lib/talloc/talloc.c:=
981
>     #4 0x7f4c17ef532c in _talloc_zero ../../lib/talloc/talloc.c:2422
>     #5 0x7f4c173d5e87 in tevent_context_init_ops
> ../../lib/tevent/tevent.c:487
>     #6 0x7f4c173d5f59 in tevent_context_init_byname
> ../../lib/tevent/tevent.c:523
>     #7 0x7f4c146d0977 in s4_event_context_init
> ../../source4/lib/events/tevent_s4.c:34
>     #8 0x7f4c154007a0 in py_dcerpc_interface_init_helper
> ../../source4/librpc/rpc/pyrpc_util.c:222
>     #9 0x7f4c063da5ba in dcerpc_interface_new
> ../../source4/librpc/rpc/pyrpc.c:388
>     #10 0x5553b4  (/usr/bin/python3.6+0x5553b4)
>=20
> SUMMARY: AddressSanitizer: heap-use-after-free
> ../../lib/tevent/tevent.c:670 in _tevent_schedule_immediate
> Shadow bytes around the buggy address:
>   0x0c247fff90d0: fd fd fd fd fd fd fd fd fd fa fa fa fa fa fa fa
>   0x0c247fff90e0: fa fa fa fa fa fa fa fa fd fd fd fd fd fd fd fd
>   0x0c247fff90f0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>   0x0c247fff9100: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fa fa
>   0x0c247fff9110: fa fa fa fa fa fa fa fa fd fd fd fd fd fd fd fd
> =3D>0x0c247fff9120: fd fd fd fd[fd]fd fd fd fd fd fd fd fd fd fd fd
>   0x0c247fff9130: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fa
>   0x0c247fff9140: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00
>   0x0c247fff9150: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   0x0c247fff9160: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fa
>   0x0c247fff9170: fa fa fa fa fa fa fa fa fd fd fd fd fd fd fd fd
> Shadow byte legend (one shadow byte represents 8 application bytes):
>   Addressable:           00
>   Partially addressable: 01 02 03 04 05 06 07
>   Heap left redzone:       fa
>   Freed heap region:       fd
>   Stack left redzone:      f1
>   Stack mid redzone:       f2
>   Stack right redzone:     f3
>   Stack after return:      f5
>   Stack use after scope:   f8
>   Global redzone:          f9
>   Global init order:       f6
>   Poisoned by user:        f7
>   Container overflow:      fc
>   Array cookie:            ac
>   Intra object redzone:    bb
>   ASan internal:           fe
>   Left alloca redzone:     ca
>   Right alloca redzone:    cb
> =3D=3D10844=3D=3DABORTING
>=20
>=20
> On 21/05/19 15:45, Tim Beale wrote:
>> Hi Gary,
>>
>> I noticed the dcerpc.bare test is a bit flappy. I've seen it fail both=

>> in gitlab CI and running it locally. Usually it just gives me an error=
 like:
>>
>> error:
>> samba.tests.dcerpc.bare.samba.tests.dcerpc.bare.BareTestCase.test_two_=
contexts_tcp
>> (samba.subunit.RemotedTestCase)(ad_dc_default:local) [
>> Exception: was started but never finished!
>> ]
>>
>> Sometimes the python test itself produces a segmentation fault.
>>
>> It seems like it might be related to commit d65b7641c84976c543d 's4
>> librpc rpc pyrpc: Ensure tevent_context deleted last'. On master, the
>> test fails maybe 1 in 4 times I run it. I reverted this commit and ran=

>> it 20+ times without problem.
>>
>> To run the test locally, use:
>> SELFTEST_TESTENV=3Dad_dc_default:local make testenv
>> python3 -m samba.subunit.run=C2=A0 $LOADLIST samba.tests.dcerpc.bare 2=
>&1=C2=A0 |
>> python3 /home/timbeale/code/samba/selftest/filter-subunit
>> --fail-on-empty --prefix=3D"samba.tests.dcerpc.bare."
>> --suffix=3D"(ad_dc_default:local)"
>>
>> Cheers,
>> Tim
>>
>=20

--------------1F82FEC6CD8F259E6591724A
Content-Type: text/plain; charset=UTF-8;
 name="dcerc-bare.patch.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="dcerc-bare.patch.txt"

RnJvbSA5ZjE0OGQ2NGI1YmMzN2ExNWExM2Q0ZWU0MDVkMDU1OWI4N2IxMmE3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBHYXJ5IExvY2t5ZXIgPGdhcnlAY2F0YWx5c3QubmV0
Lm56PgpEYXRlOiBXZWQsIDIyIE1heSAyMDE5IDExOjQzOjU0ICsxMjAwClN1YmplY3Q6IFtQ
QVRDSF0gczQgbGlicnBjIHJwYyBweXJwYzogRml4IGZsYXBwaW5nIGRjZXJwYy5iYXJlIHRl
c3RzCgpDb21taXQgZDY1Yjc2NDFjODQ5NzZjNTQzZGVkOGYwZGU1YWIyZGEzYzE5YjQwNyBo
YWQgdGhlIHBhcmFtZXRlcnMgdG8KdGFsbG9jX3JlcGFyZW50IHJldmVyc2VkLiAgVGhpcyBj
YXVzZWQgdGhlIGRjZXJwYy5iYXJlIHRlc3RzIHRvIGZsYXAuCgpCVUc6IGh0dHBzOi8vYnVn
emlsbGEuc2FtYmEub3JnL3Nob3dfYnVnLmNnaT9pZD0xMzkzMgoKU2lnbmVkLW9mZi1ieTog
R2FyeSBMb2NreWVyIDxnYXJ5QGNhdGFseXN0Lm5ldC5uej4KLS0tCiBzb3VyY2U0L2xpYnJw
Yy9ycGMvcHlycGMuYyB8IDcgKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VyY2U0L2xpYnJwYy9ycGMv
cHlycGMuYyBiL3NvdXJjZTQvbGlicnBjL3JwYy9weXJwYy5jCmluZGV4IDA5ZjNlMzIwNzRi
Li41ZDEwMjAxYmI3MCAxMDA2NDQKLS0tIGEvc291cmNlNC9saWJycGMvcnBjL3B5cnBjLmMK
KysrIGIvc291cmNlNC9saWJycGMvcnBjL3B5cnBjLmMKQEAgLTMwNSwxMiArMzA1LDkgQEAg
c3RhdGljIHZvaWQgZGNlcnBjX2ludGVyZmFjZV9kZWFsbG9jKFB5T2JqZWN0KiBzZWxmKQog
ewogCWRjZXJwY19JbnRlcmZhY2VPYmplY3QgKmludGVyZmFjZSA9IChkY2VycGNfSW50ZXJm
YWNlT2JqZWN0ICopc2VsZjsKIAotCS8qCi0JICogVGhpcyBjYW4ndCBmYWlsLCBhbmQgaWYg
aXQgZGlkIHRhbGxvY191bmxpbmsoTlVMTCwgTlVMTCkgaXMKLQkgKiBoYXJtbGVzcyBiZWxv
dwotCSAqLwogCXN0cnVjdCB0ZXZlbnRfY29udGV4dCAqZXZfc2F2ZSA9IHRhbGxvY19yZXBh
cmVudCgKLQkJTlVMTCwgaW50ZXJmYWNlLT5tZW1fY3R4LCBpbnRlcmZhY2UtPmV2KTsKKwkJ
aW50ZXJmYWNlLT5tZW1fY3R4LCBOVUxMLCBpbnRlcmZhY2UtPmV2KTsKKwlTTUJfQVNTRVJU
KGV2X3NhdmUgIT0gTlVMTCk7CiAKIAlpbnRlcmZhY2UtPmJpbmRpbmdfaGFuZGxlID0gTlVM
TDsKIAlpbnRlcmZhY2UtPnBpcGUgPSBOVUxMOwotLSAKMi4xNy4xCgo=
--------------1F82FEC6CD8F259E6591724A--

--ROTWIyghfqLqvWjTS0vC28HLpxcZ7L1rf--

--8pfMVrIaTHINxEQWHosp1dL026CTmJytu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEDO84T/PRptSsMEixei/9ZKIyR1MFAlzkj64ACgkQei/9ZKIy
R1NxqQgAjnsRIdDaLZol+nKQbNm9CNb3cy0bOfdiHVxccOFEIN0EZHS/KBr+2MUJ
8DXuum8nGEO0odZMoJ7qP3vHdIWvAtEjA6yS7bEOhBCoGiQuu5jzSLQ6AleIqY0E
xjJ3sq7jq8GHCTtuCBjiy+upt+lPwE6iulOy5od1fe78lLhkH14zh6c4TJX19p3f
g4LCCFbdXhjBWJWKflXpQ6bvW2MkmFOVgUEyYDyH4lTrsyBusk5K5rEaCOuKoLvE
80wCmUeAnH+IGh9WT0gtqY+MeU7ESnxb8QyAdm2HAoGBowprnJGq5aCHLqOhSyNy
ohWzDqGydHEox9yk4lSPqCcyn9VFSg==
=IUfY
-----END PGP SIGNATURE-----

--8pfMVrIaTHINxEQWHosp1dL026CTmJytu--

