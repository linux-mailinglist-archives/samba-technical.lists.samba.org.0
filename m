Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B3385B464
	for <lists+samba-technical@lfdr.de>; Tue, 20 Feb 2024 09:04:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=+M5PXbTxHD7v77fegGPJW0njNzkvOMV+P0Up0ZVweBw=; b=aEPlbwrnV+L523Bz1EitYzC0U+
	YmAAvfn4X+rU/bGYBrEorW3heAkGbIviXQ/iy1OkEroele5s+xv0wuOJtNJYnniCWL+7LngoqyjdK
	MDtCTNxcVDiJHW12p2YY/czkIhsqzbav3l7SGB0RM2n+tVJOewOAUzKXXPHGdCBc8CPxhFOGkp45T
	YNffHIahduf30Ans/4QdjiUAITCxI+PRceKPl6A+Rwst0Y5JaVeJmAIWd4ck0fFgynxKCW1V7Z0Jd
	/0B1Kbo23Fg0qY8wGEKPe61vtFDx9kSl6haEtTjRkRUOZmCuvvPca0eYQL1ZJDy3htLUPPVooSsKW
	+o5K5njA==;
Received: from ip6-localhost ([::1]:20996 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rcL6g-008yiz-Ol; Tue, 20 Feb 2024 08:04:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14480) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcL6d-008yis-9b
 for samba-technical@lists.samba.org; Tue, 20 Feb 2024 08:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=+M5PXbTxHD7v77fegGPJW0njNzkvOMV+P0Up0ZVweBw=; b=pTIXV73LxB3EdiGqouNMpOcIb3
 h5EyCQyux9iKX3+6Zmpr5QfoT85S4n1fyziS17yHstFrgXrxZjCVR6dd1Z7/8eH8MtVNCBrIgpaWL
 s3lYJ6TJD3HV1Dfu8MJGcLTCKjmwcqg9X5l5W2cs7MGMW4zTmGSnCIQZhNSI2bqTa1WNuywxS7GDH
 5Gv6l3IKwoWELKJnPn2+X3sNBvxbGntI4WfrfkyPIj69SKkhzIrkoPCnLVUMhG+vLCc0h46F6XYgo
 HS0DT/hBsCuEHafNpKYD3JyxVJwXEKRiVX+D91PXu8edVh/CavRO8b9sDfdIt+Mi4S5rjtEglNJ1P
 /Ygn/k2/T9H5lOjFlPt5hKHMkPPi+rXfsAZUtOPRTeRZW/XFiGDXuPTNVET83iejWY2ozHhC/rD1z
 YcchHO5ygSsG+JiUsv71OpI6JGpxSOd1xB4FiMw9+o86sLNp5hWjx4duWGKKy8UydARRw6Z2tEMIO
 7DNZumIUvy4bJsyk4D67LenK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcL6b-00DvCO-34; Tue, 20 Feb 2024 08:03:58 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: [MS-GPOL] 3.2.5.1.4 Site Search
Date: Tue, 20 Feb 2024 09:03:57 +0100
Message-ID: <2208707.hkbZ0PkbqX@magrathea>
In-Reply-To: <20240220080057.5b10136d@devstation.samdom.example.com>
References: <4365205.UPlyArG6xL@magrathea> <2627406.vYhyI6sBWr@magrathea>
 <20240220080057.5b10136d@devstation.samdom.example.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 20 February 2024 09:00:57 CET Rowland Penny via samba-technical 
wrote:
> > > Have you tried adding '--show-binary' to your ldbsearch to see if
> > > you get the result in a readable form ?
> > 
> > I need the result in python and there ndr_unpack on the data doesn't
> 
> > work:
> I meant it to check if the base64 encoded result was actually the same
> as the wbinfo result, you could be going down a blind alley.

If you want to inspect it you can do it e.g. with:

ndrdump nbt NETLOGON_SAM_LOGON_RESPONSE struct --base64-input --
input=EwBcAFwAVwBJAE4ALQBEAEMAMAAxAAAAAABFAEEAUgBUAEgAAABsfosaQV2fQrJLMfRxuNCLAAAAAAAAAAAAAAAAAAAAAAVlYXJ0aAhtaWxreXdheQRzaXRlAMBGCFdJTi1EQzAxwEYKOKjAffMDAAMAAAD/////


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



