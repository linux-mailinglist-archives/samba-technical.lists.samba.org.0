Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A32E160301
	for <lists+samba-technical@lfdr.de>; Sun, 16 Feb 2020 09:47:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=lShE3gLFnf2q9CUdDSevMTOzdrXh+mczoiVKqL3NqHk=; b=V1h0/V9CjHpXOl3rUgz+GLLMgE
	Kelfq2pANwQ1+dnvFmzXM0rhCygVoUDjILPpiJClEblFOkAa8THDy8LNCMSUw68JVruDnglJ0IN8N
	tLA2c8vugwyCigRG6iAJycmgJXBoUWygP/eR91jAjs6vORMkoo6qLHlSSbPcoit4GMc0qG6GsFCoA
	g/mWFy4+W2hupgrWBmPvTJh6HI7xIzTUyL8wwC8fsmgHgZppsWJaKmcCrZ6/F1TgoYPGn9vyALtfV
	a1osVudkrAQ4kxoQkcpF31s8DnZ2bjp/jYg82GnmHQjuBrUDQGP1vZcvA+pYfyJ4XvDE8wJndizgF
	vYpSUogA==;
Received: from localhost ([::1]:39612 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j3FZh-00A4kw-4k; Sun, 16 Feb 2020 08:46:49 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:45412) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j3FZa-00A4kp-E9
 for samba-technical@lists.samba.org; Sun, 16 Feb 2020 08:46:46 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 0A40680BD8; 
 Sun, 16 Feb 2020 21:46:20 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1581842781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lShE3gLFnf2q9CUdDSevMTOzdrXh+mczoiVKqL3NqHk=;
 b=nPimMKqTOgu0bDhNBX3eS/OHSn/PQJG7aldWHJitbpIcRfXYkQyuhLz6ouRa/2JI1dWMCg
 YYWWLDOP/2o+kP9gxSOiPqTbATpecn6U5gB/PqZXOONgLGgnGdvHrmQnYrNNDoIsxW8Mhk
 YmIyLBrr7QQzkfRmY5OxmTWGRr9XgSDCLuKi4Eh4qgoNXJ5TAv0C+KDCRC8x16/qpYm6qk
 dsUTz/m+OvmxbqwrfWz2R0Z7lY6aXoPUgn6RBQoakfIejXCUGBgJ/icgO2vC7TRGx9esSJ
 ESbNF6r486lv9emOQAR+LAMVZCPCI/2Ywmk0EbsnogoB3G9jT/dqEqxWQE4R7g==
Subject: Re: too many layers in selftest
To: Jeremy Allison <jra@samba.org>
References: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
 <20200214205049.GA51881@jra4>
 <ffbb3c2912a79ca4c32232280b0ce689597aa99c.camel@samba.org>
 <20200214210210.GB56355@jra4>
 <d5ecfe8e74ddd8d62ef76203fd8784d3cd7aee5e.camel@samba.org>
 <7f8c06ad-11f5-52bd-2319-30f2cc081df3@catalyst.net.nz>
 <20200216013145.GB13472@jeremy-acer>
Message-ID: <70657e9a-2ded-c302-46e9-48611d63f1f2@catalyst.net.nz>
Date: Sun, 16 Feb 2020 21:46:18 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200216013145.GB13472@jeremy-acer>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 16/02/20 2:31 pm, Jeremy Allison wrote:

> Hmmm. Does you end up seeing dog faces everywhere in the
> code ? That's a strong argument for us living in a simulation :-).

Well, now you mention it, I am trying to grep for dog faces, and
finding the tool woefully unsuited. The best I have found is the
owl-like:

lib/ldb/pyldb.c:        if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O|O",

and the last figure here:

python/samba/kcc/graph_utils.py-                        o
python/samba/kcc/graph_utils.py:    pass: o-o=o  o=o   (|)             fail:  o-o
python/samba/kcc/graph_utils.py-            `o          o                     `o'

So maybe we are safe.

On the other hand, I am not sure your argument works for samba tests.
When you're already in a fake environment, in cwrap, in a container,
on virtual machines, what difference does one more layer of simulation
make?

Douglas

