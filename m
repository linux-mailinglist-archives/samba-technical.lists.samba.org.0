Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E2C7E9DBD
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 14:48:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=stJr/jlIU2XVcDzmCYYbnL6sQWujO1D/FSkTVtbh5W4=; b=L1E64FREULFAYLrlA4pJ3r4980
	+yhToqAHDnSRHFeJbBcr6LiqiMl5pTB0tx4Nyf/evhJU6D2dwGVEhSMxxPw52LlFCIq0M8JD1qeiI
	SbS1FuPtubaD+1Wn2hrP66UKTQLQ9daMoq1W3rogUssBcoABaQ88XlwoBUPNJFyNd21XdPz5Rtatq
	Z3+ujfoWybPNpYuUPycGWERw97y2NUVoj3MkM85EYk+NlysWUJ8V3n/ofrlUH8RPg7QdpYeez+BJB
	BMw7m1mPgGJPzZA4qdZCg2vSw5xx2rD/uSwkm+lhyn4I989bKwljhYmoVCTxJ9SUsTqF5WRRO6nqn
	O3mQNVqA==;
Received: from ip6-localhost ([::1]:64960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2XIp-007wSZ-WF; Mon, 13 Nov 2023 13:48:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33706) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2XIl-007wSQ-3g
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 13:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=stJr/jlIU2XVcDzmCYYbnL6sQWujO1D/FSkTVtbh5W4=; b=Z3eBWb44QoBMwJ2czLxx0yu+mh
 b+rcj79+wGcSi8RETwn6fHxpNWBl3FQ6di8/398deaHZHSmmXRk0x75RLpU5IKaEkuPz1fzIRQk0I
 PUhHNDv50Vrv7Me6GVSoAsFcvVBMReVNEk4NWb5SQveZuxLJ69fzqoZWBpAL2R0GKHFxy1CNbGN6G
 nnjMiEEsT0LiAo7Fy05gbgjdrHdPKSlO55x5E62UUPl25VR6ZYKI+KGZarsmkY3ZEfmB5m64Ip17R
 3dP7wt+3mN4jZ28QQwUyv6wlQCptR2MkFP98Xuq1MxidTOaELap4gYMuS96RkVNDIE18qvWkzm5tU
 ElzBJlIb2VxUkXtFirTdTPCdg7SswCKHX59vtd5u5ONaUQramkzJrv028S9GvG1ufVeAvzuXX7I0I
 cxH7Y86Wu8JkjhfTFIfPI2kkfCz9jKsyJW1b5L0rISQEq5NKCuuSAkQyz7SufutOqZX3XXSDre3mQ
 y9pyJiEeSIHobBBQVrSJ4yrW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2XIk-005vK0-1a for samba-technical@lists.samba.org;
 Mon, 13 Nov 2023 13:48:30 +0000
Date: Mon, 13 Nov 2023 13:48:28 +0000
To: samba-technical@lists.samba.org
Subject: Re: Audit log dsdb_group_json_audit with with "userSid": "S-1-5-18"
Message-ID: <20231113134828.7432a8cc@devstation.samdom.example.com>
In-Reply-To: <CAOGObpiU49+z0cQvvpqTZ5aW1ozzpKxz6x4GDeCx+iVwArAoeA@mail.gmail.com>
References: <CAOGObpiMd0krLek4p46SYHTZpDwRGfGdD9PbxH_QUvVCe30-OQ@mail.gmail.com>
 <20231113125324.0cf1b58b@devstation.samdom.example.com>
 <CAOGObpi01iUPmGdB-KhjqNo8t0zgVWK8XJzjw8ATBYD0uWj8xQ@mail.gmail.com>
 <CAOGObpg3sK8soryGdY+BC=TG8=gctm-7gkR0LYxubkFMbGXXkg@mail.gmail.com>
 <20231113131844.1e590785@devstation.samdom.example.com>
 <CAOGObpi518QAHT61=NRBfNuyfCKT8+TV7Rf+Y0EX2YzCp5eqzA@mail.gmail.com>
 <CAOGObpiU49+z0cQvvpqTZ5aW1ozzpKxz6x4GDeCx+iVwArAoeA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 13 Nov 2023 14:35:26 +0100
Cristian Galvani via samba-technical <samba-technical@lists.samba.org>
wrote:

> Problem found (I hope)
> The first thing is that is not a real problem, it a "samba-tool domain
> tombstones expunge" for testing in console I did "samba-tool domain
> tombstones expunge --tombstone-lifetime=10" and the output is the
> same of my first post
> 
> 

You are probably on the right track, though without seeing the logs it
is hard to say. What I can say is that 'SYSTEM' is the computer and the
computer must be doing 'something' and that's what is getting logged.

Rowland

