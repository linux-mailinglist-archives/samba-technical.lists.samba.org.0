Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B42F23F18C
	for <lists+samba-technical@lfdr.de>; Fri,  7 Aug 2020 18:52:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=6eq/mVjMCnAqjwIRMbb0rpYYc5AB1a7x1XLC+lRoqUY=; b=yR5dRoZ75XfwR7IaLxa3FAB/DI
	xlPwo6pZ0Q0xttDAe2SXGe3aBgGt7EFrcPs/346R6y9wr7ItQfv1TBM6uP6NaO+fi7qfzGugNfE+m
	pBl4ImWexWZzoOUqeH18h0VnDynFZE+fCMYOJnrbEVA5W+wbO35RbQyh4U7Ho6p9rumsnrXxt2BLx
	gbRTPAfLjoFBccM6Mb6gMcbtrt+ZoYpvM6fvlFXgbiSxpCFRBObl2kJZiNNb51GXHI+B9aaqyajpq
	FexS/1q4R6/n1v+jnHy8FdliPthYIUcTBO8hKjcVYvYTGoSrBAhgn3Qea8XOXZv+XSlTb6TMkTE8w
	o1xsta1Q==;
Received: from localhost ([::1]:64318 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k45bd-00Cnkf-9p; Fri, 07 Aug 2020 16:52:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40926) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k45bW-00CnkY-Jb
 for samba-technical@lists.samba.org; Fri, 07 Aug 2020 16:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=6eq/mVjMCnAqjwIRMbb0rpYYc5AB1a7x1XLC+lRoqUY=; b=QafouEQ+hMK1awkpUYW3qlj8bq
 lA/ZjcinSC7s92l7DWz6qyHNMxx4qC/mfUPr0J5+vex0Z1bpn9q4d174GfGgZpXLwQS5SV3ERl3h+
 4VpuYqkm1VMZB5M3xcE4c2F5lqpO5ydcCOLHmOBg6/tlLCG5OyQf1X38FMKvIyXoKLdHScAwnvsj9
 4IiXMdUWAg//DLoYWc/vY2M7uggysMLlj9A8V7G7LLlEDbnSfr43Lyiaj15wbv8i8/2tq+Q9XG2a0
 DiJ9ehizN1TG2AKZLRyQALjRZbVl2a091ngJEebjyUOZQiW/wmxadedSJBD2AzNejhpSlFb353swW
 uCbdLYQEw7EfsqvHIj9qsRoMphv6wJppBkLI9v3f/Hxp/blSpIYXSLqcmnyIKV2D325CkOJX//kik
 KQDxkdIfigVGOwEoNPwx5y1ksWB44TVAcNMPZGKDEgeBidg5rq6l2Cn2UEDaJdwL/xLRB0vlH+ouI
 vdqp3mP6bxLuJCzZ8QhVFrvR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k45bV-0006ei-Od; Fri, 07 Aug 2020 16:52:25 +0000
Subject: Re: S-1-5-21-Local-SAM-SID-513 -> LOCAL-SAM-NAME\None
To: Jeremy Allison <jra@samba.org>
References: <83e89636-75d4-547e-c93f-4184da64255b@samba.org>
 <20200807163743.GE6866@jeremy-acer>
Message-ID: <be19ade3-451a-7565-4a1d-b9609648c490@samba.org>
Date: Fri, 7 Aug 2020 18:52:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807163743.GE6866@jeremy-acer>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IKVvb62wnYZFHFAcFmHcQ7D1XmSYEyL0F"
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Stefan Metzmacher <metze@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IKVvb62wnYZFHFAcFmHcQ7D1XmSYEyL0F
Content-Type: multipart/mixed; boundary="kdxBM7VmGFhGeQwOSBzOG9Di0gO3JqM12"

--kdxBM7VmGFhGeQwOSBzOG9Di0gO3JqM12
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 8/7/20 um 6:37 PM schrieb Jeremy Allison:
> OK, what it looks like is a call that can *never* fail
> on Windows - e.g. looking up S-1-5-[LOCAL-DOMAIN-PREFIX]-513
> must *always* map to "Domain Users" group.

but why on earth do we return "None" instead of "Domain Users"?

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--kdxBM7VmGFhGeQwOSBzOG9Di0gO3JqM12--

--IKVvb62wnYZFHFAcFmHcQ7D1XmSYEyL0F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl8thsgACgkQqh6bcSY5
nkYiSQ//YRxfzcDtXqAC7IlgTLQ8THsLRQdYo2MTLuXpPI7IwcnFVA8stSk4V8WW
/2tIxbqjakPJCocf2nARAdpZGFLasBPOpMBiW4+6AB1uj6yOaViW+cY+lR0TzIFN
Br96/xYzNT/YILymb4YmZg1a83x4uPbFaqQyV/W75Yt23NgFC+54Yq1WpN7ArjVD
oBYDxBVs5WnKmjeXtApOg10ts4X0fpvCnsMkTKQbKg9MTRjFH9UyFSzeIkXYySBm
AGCyQ4C87gqT6LBRb0l+86vgJpQXV0tjxsNsP+uAZZnWZEPwgBH6r38k2QQUwHKy
ZG/X3tJEV9QH1sfxo70aL4T4STSL5tunC7pqkhyfxuege94sJqMffTyYszJ+X66N
n/z0AN6/XG8/hJllYJTN7RnFsCN8/Zh91zzEoq67vZx/o9Hex/ProEstdVtrxis+
jdLCu2hBT+5NZDh75cmAUYSCI3BRLuOMwoMk6hNGgCEFETk53cJvTKfI72OCYEnp
TGYlib3HVUqJko9/nC40QqueJ99n1inIwPMrr7viDKXDox7pj62AsoDgkJuzPhvn
baCuv3MVyulRzye3V3wuFcs7kG/bphMjEAtf/Gzg/bnGHPPvm2ViRZxBT0rV5iuP
nvXz0Nu2X+BPv5LjVsJ1nDBMGPIJputyurZbCbsiPiTV02QTimI=
=4CDd
-----END PGP SIGNATURE-----

--IKVvb62wnYZFHFAcFmHcQ7D1XmSYEyL0F--

