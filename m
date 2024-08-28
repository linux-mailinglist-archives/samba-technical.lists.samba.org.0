Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9289696254F
	for <lists+samba-technical@lfdr.de>; Wed, 28 Aug 2024 12:56:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=viXF4mtCe5yUB1cEJcB012lnBYtOALsGjjhQjsGDepc=; b=XkgG7Ki7xg+hOFIlXJHMT6fngk
	D5BIiZz+i0v5YdS69I8URXw1CwlpGkcLDCJt58fv09A5MPtZ5yOGf1AS91FTOx7AgOdipzp/SSMZ+
	ESC5IPTAemHvwrqlTnYGWjiKJ98kNnpeE04ylvr45dwLuuQ5/JPVjgPIQ2VP1CbekfZS8BgL8yMbk
	2Am+7QSJ+4RcVapJXDGCkWbTB4UbCcEy7s5xsQMrWiNhjWdP/ik/mDIQ+W5QgvqtKKRRCG4bV8rrI
	mfPoTmsGZCJuyGHDmdoApaNSLUbqYD349EyyYgLMohBU6bu68WP/qR9NdFf8seORAnFlcvYifNGkd
	ReQa2wiA==;
Received: from ip6-localhost ([::1]:45192 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sjGLB-005i0J-14; Wed, 28 Aug 2024 10:55:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27408) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sjGL7-005i0C-1i
 for samba-technical@lists.samba.org; Wed, 28 Aug 2024 10:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=viXF4mtCe5yUB1cEJcB012lnBYtOALsGjjhQjsGDepc=; b=r3WIZjQn+RF3TDhQBaqctoDcgy
 QpjzOsVSn43jKZFH1t3smOj608kmDgclTL/L5Q32qHfWmZrXab0OrmB5P4ARV+3Y7fORihl977Kc2
 rht5Qb0hqsj9FAA0VR1FqAGxHN2FZEzAlpx8xVSaEJZaU4I56Z3uFZGoPLosLzJjk0Pg253EXUs7q
 cPNSM2lO0x5na6TUS0/YaPJY2O9yKOkOpcJwJ7JrckxOo4HmaLHY/B2uXAkZ8f3nN2RvaX934XemX
 h/nXnEs9GmVS1eg+vTUXYWiXOB7yuxVO5+PBEukDDQUmE5VceYDnJ0YtbE9qpUB+YDAxYiJ9E5qni
 BJ0xdQHzwSLrB9KqURejbCZz30L2lFK6AK9ZPWhzScWYG/T/3L84rfDRg+RJHPU1TK0io6K0T+WqN
 4fsgb4NXcuviK5UX2c3IxJS1eC/LV5mz36dSEPxmeuDcYKu133d6AXSBbnF5wbaxDJdJaKHyMXJ+0
 2J/Gbgq6T33pGFaZPi0Qd7Bn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sjGL4-008mHu-2G; Wed, 28 Aug 2024 10:55:47 +0000
Date: Wed, 28 Aug 2024 10:55:36 +0000
To: David Howells <dhowells@redhat.com>
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
Message-ID: <20240828105536.1e6226df.ddiss@samba.org>
In-Reply-To: <951877.1724840740@warthog.procyon.org.uk>
References: <20240823132052.3f591f2f.ddiss@samba.org>
 <Zk/ID+Ma3rlbCM1e@jeremy-HP-Z840-Workstation>
 <CAN05THTB+7B0W8fbe_KPkF0C1eKfi_sPWYyuBVDrjQVbufN8Jg@mail.gmail.com>
 <20240522185305.69e04dab@echidna>
 <349671.1716335639@warthog.procyon.org.uk>
 <370800.1716374185@warthog.procyon.org.uk>
 <20240523145420.5bf49110@echidna>
 <CAN05THRuP4_7FvOOrTxHcZXC4dWjjqStRLqS7G_iCAwU5MUNwQ@mail.gmail.com>
 <476489.1716445261@warthog.procyon.org.uk>
 <477167.1716446208@warthog.procyon.org.uk>
 <6ea739f6-640a-4f13-a9a9-d41538be9111@talpey.com>
 <af49124840aa5960107772673f807f88@manguebit.com>
 <319947.1724365560@warthog.procyon.org.uk>
 <951877.1724840740@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Paulo Alcantara <pc@manguebit.com>, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org,
 David Howells via samba-technical <samba-technical@lists.samba.org>,
 Tom Talpey <tom@talpey.com>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi David,

On Wed, 28 Aug 2024 11:25:40 +0100, David Howells wrote:

> Hi David,
> 
> I tried to apply the patch to the Fedora samba rpm, but I get:
> 
> mold: error: undefined symbol: torture_assert_size_equal
> >>> referenced by <artificial>
> >>>               /tmp/ccVA4FUD.ltrans35.ltrans.o:(test_ioctl_sparse_qar_truncated.lto_priv.0)
> >>> referenced by <artificial>
> >>>               /tmp/ccVA4FUD.ltrans35.ltrans.o:(test_ioctl_sparse_qar_truncated.lto_priv.0)
> >>> referenced by <artificial>
> >>>               /tmp/ccVA4FUD.ltrans35.ltrans.o:(test_ioctl_sparse_qar_truncated.lto_priv.0)  
> collect2: error: ld returned 1 exit status

I've no idea which Samba version Fedora ships.
torture_assert_size_equal() was added to lib/torture/torture.h via
46f0c2696582 (samba >= 4.20.0).

> Do I actually need the torture test patch?

No, not if you can use your xfstests reproducer. The server fix is now
in Samba's master branch as commit 5e278a52646 ("smb2_ioctl: fix
truncated FSCTL_QUERY_ALLOCATED_RANGES responses").

