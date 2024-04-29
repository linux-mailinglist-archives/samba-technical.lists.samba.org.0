Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C36F78B63D8
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 22:46:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1udO1/f8UlXM/Jp6Uj2n3BOKBlto0SLoeHVuXsEEi4A=; b=iAZRqVyDF2fek6prhtXgOTmVgm
	zJoAQfNoDhX9ulD673l15ve6JOvBG+nZD6oQqJjG2lVFz5EWVOfVBBg/8dtZ3DMaij+f2mCeEAQ4y
	aSXlRIuzc3JTt0e48SpBEcDMJP/m/k26ejPSMT+J9yvd8mAxqyEaFwGwzYvwZo5ZOTH+wfqPOkxHZ
	slBo2NoEuac41WV5n6ghPDu2CWzLbfvohgtyprlQC5KRc8kmlg3OvlNMTkd6RqqPgY+bM63REsDk7
	BUQYBCJuF5s0JtCA/AXT9YqNW8iznQkZPDWnzcCewHlaGPwEWsmF+BVpGpG8+LEOpi8k60mtET+8C
	TXnaD3EA==;
Received: from ip6-localhost ([::1]:45694 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1XtG-00623S-3q; Mon, 29 Apr 2024 20:46:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16064) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1XtB-00623K-JC
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 20:46:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=1udO1/f8UlXM/Jp6Uj2n3BOKBlto0SLoeHVuXsEEi4A=; b=CiVlnYo7D7b28+g4BDRu72g1iE
 oaPYETpD6e8RwYJlD1aguhf+g2iq0jxjOPi4W0KSmMgLXDO1MetD1q6qgB0n1c2hiWF+5lFFxtAjm
 Bx+8sk46BOQft7rJtqf4WoB7EcYwI8OYihlDlQ4XTUlJ0f3Ok99i2AgmGzwLiEDXGDd39Xrn3VwWB
 ibtXG50lwQ2ikP0mrja2XXyuBQeuatYyxDR51A8I/S5t0nMBEm3LqcIlQ4HyRW+VGVG2cIFECkVXw
 EOCt8Sia0vdqWC40sTtJGxdXQx4ysZzmE2dJ6kGilN/7FgiPyCFQrBLrg95zF3xEod6BzzuCRd173
 ob4M3WX7Td2uSJpVjuGRzFhKOWcKurnzxehfQIFFlMpzP4EME3OBJ9KAa7NAr7a7XnSJ2eCOBSCsD
 MjckAHrVOVypNt2tOilO0+uV6FW2uAenRI5S8wh7VQMaRRjY626WYfHRGEetOjxheHfYjSYv1pF6v
 rQnrPj/IOHENDIcT1/w6gnkC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1XtA-008zdg-0R; Mon, 29 Apr 2024 20:46:16 +0000
Date: Mon, 29 Apr 2024 13:46:13 -0700
To: Steve French <smfrench@gmail.com>
Subject: Re: Samba ctime still reported incorrectly
Message-ID: <ZjAHFSxjaYaybUSb@jeremy-HP-Z840-Workstation>
References: <CAH2r5muXqpZN1mu=WAhaxXe0yRB7Rib_CaoGo3h15wwcSPZFuw@mail.gmail.com>
 <b40a9f3b-6d2d-4ddc-9ca3-9d8bb21ee0b9@samba.org>
 <Zi/WD7EsxMBilrT0@jeremy-HP-Z840-Workstation>
 <d9f60326-9ddf-485f-81c8-2012b7598484@samba.org>
 <Zi/8DEo+ZiF24LLw@jeremy-HP-Z840-Workstation>
 <CAH2r5mu2Qr5W1eUOz-JFyf4X6Wk9X2Jr4XFza4tJmH+mVVZqLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5mu2Qr5W1eUOz-JFyf4X6Wk9X2Jr4XFza4tJmH+mVVZqLw@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Apr 29, 2024 at 03:16:02PM -0500, Steve French wrote:
>
>Another test to try is xfstest generic/728 (which checks that ctime is
>updated on setxattr)
>and xfstest generic/236 (checking that ctime is updated when hardlink updated,
>where I originally found this bug)

Well remember the time tests are meant only to pass vs a Windows SMB3
server. So we need to make sure everything works there *first*, then
if we need to tweak specific behavior for POSIX+SMB3 we can look
into changes based on a POSIX handle being negotiated.

But that should be a last resort IMHO.

