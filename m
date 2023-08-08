Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C77739C0
	for <lists+samba-technical@lfdr.de>; Tue,  8 Aug 2023 12:43:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ADKOWn38v7Fy3GaTxBRB+EU8XnRmWrnTw41zwTaAbnw=; b=HYqE0P3nEaOTfNrKuP8Ai8c0nC
	IH8gzCHWvgWKisAwm9HtaM37ESlmKOVvh0yNgiYyY9bYwyLlEu/LIkbkKm3v5s4OaMct6HVEoFX8/
	cBitJ/vNgjMDrqtAKIPlGfZt+8H8yn1pdVUZx9tl76r/s83yk6W8EoLQvNS25wntIzP0CRXgk/s4E
	dYVKVAnC+SBKYuGgnwQKfCs860elgSDnv22gpZ6vVcQngVFUNwunDruP7c2yxVPlor4JaLVNr2NmS
	QGW5fFZaKLZyn0jeCx3H1KaAvqPRdT1Uk1TiJwxAS9vR0RqrFEHTg/h5pwgUjntULyAwM5V0qsmgG
	/c10ONGA==;
Received: from ip6-localhost ([::1]:21368 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qTKBA-00AmgQ-Lv; Tue, 08 Aug 2023 10:43:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59606) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qTKB5-00AmgH-Cv
 for samba-technical@lists.samba.org; Tue, 08 Aug 2023 10:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=ThXl+xmAk/uUWP0d5BnI1zJZrIul2VV2u++JMkjrP0k=; b=hOKFefQM6p4tLe6zitcrFNevtS
 X7Ou8jqbeIvy8EyHt3e8qnYBJIlha2ApxjkF+gJxROFu6Er/3MqYl8nySk66V4z514zO9hr7HeYm/
 V0OYwphOvaNQ41YTMqsFDg00lrqPrZmwg+/OGWqcne7JYBqPI+7ERGiFjQOXaNtvcvZMUrcn4zICS
 7YsOsHzYEk3kEXuDhh1J8US2jxBs5/iN7+am49HKH7ABcaiPkD2aY19MNRPxrQFYOPY9SLDdoh5kl
 4KXhXNwkivpeRjJnJXCV7Zbjfj5P8dA/fzNSJ0nERCwLCDwdJlqIh+UeodiUSOfSvC5L2Y1XIO3N3
 q7BSEJIdb9gMgRdg17fVsMlOS5pq+1eylf/CRjsgp0MtoHKIYNYzo71nQ+aNRXV8EWfMjPtZEyWme
 y2muktUfql/iVZREpVPcgTmP9qV8LLbgXOljW5mMyEjbyKZgJvvBzwiRF35sDYJvBjL2UssDeWO2a
 D/zaVRhtM+S6IF/ZLzZogSXn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qTKB4-006oQR-1I for samba-technical@lists.samba.org;
 Tue, 08 Aug 2023 10:43:02 +0000
Date: Tue, 08 Aug 2023 10:43:01 +0000
To: samba-technical@lists.samba.org
Subject: Rust bindings for TDB
User-Agent: K-9 Mail for Android
Message-ID: <79BC9465-F780-4944-B996-35D7974F0DA7@samba.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: =?utf-8?q?Jelmer_Vernoo=C4=B3_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Jelmer_Vernoo=C4=B3?= <jelmer@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I've created Rust bindings for TDB=2E Th=2E Rust crate can be found at http=
s://crates=2Eio/crates/trivialdb (TDB was already taken :-( )=2E Documentat=
ion will be available on https://docs=2Ers/trivialdb/ at some point - it's =
waiting for their build image to include libtdb-dev=2E

These bindings aim to provide a Rust idiomatic interface to TDB, and cover=
 most of the existing TDB API=2E

For now, this lives in its own git repository at https://github=2Ecom/jelm=
er/tdb-rs=2E I'm happy to see it shipped in the main samba repository if th=
ere's an appetite for that, but it would add another tool chain so perhaps =
it's better to keep it separate for now=2E

Cheers,

Jelmer
