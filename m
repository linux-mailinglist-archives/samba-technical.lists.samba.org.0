Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7BB39D253
	for <lists+samba-technical@lfdr.de>; Mon,  7 Jun 2021 02:08:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=g9JgmPMD04sJaMUZwjDAhrl7E9IbvQLi6Okyr3emPYQ=; b=bDKMAS4bv0jsQoMDi8uOX3sO63
	i9DPyuLfyQbpzI4ovz3SMRlWU7QOueplmm4VOMbQeeT2E3n+zsenanVuNLeHH+rcU54HAniBMN+pO
	mV+pbTazc1YbcxuxDijHQdUaNatYKMsWA0oLR7DmDjyP3cG4+7wOU+6iz88c7HJiJrDobMStKgN+Z
	8EjulQUwvHyM+uWcp22S3APtoC/1hWq+VnklBJTGGx0G+D593A/AMOnznNAvzyTZKoYbxhf6/E8Mz
	MOF7IEtcEHZ7hYJCiT+rKdxolCQ8o5grgM9pcsAO9FYDKgnc4D0SPuLerhivbTI8t2PmzVW/dKYO1
	b9p6Y0GQ==;
Received: from ip6-localhost ([::1]:58992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lq2nl-0045XI-AC; Mon, 07 Jun 2021 00:07:34 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:42823) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lq2ne-0045X9-F3
 for samba-technical@lists.samba.org; Mon, 07 Jun 2021 00:07:30 +0000
Received: by mail-ed1-x529.google.com with SMTP id i13so18104111edb.9
 for <samba-technical@lists.samba.org>; Sun, 06 Jun 2021 17:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l9m6J8uLuxX+INRqQIZYBSnUhzb+TxK1CYMtvNSeIME=;
 b=ZExH3+eprUMkutyyXBiiveBxC1K6g74RENSj9m2LRuBsTn58uTaxG8xTplNu36jB8f
 tNHiwXfayzbcSTP0QF8C1s2U/2FTf/gDrpQ8j8oOi2/JPbSBgsqeiNLxh/ba6YDHByYj
 dJNIIWjd+ynvm8dQnf+6j8SjIhcGKkrroNz2zT741N+6CwJlkHYc0DbRJVmu8kjHWVTb
 ynODIaF6VXfc7eTAWB7KoDAZVgqILdUnD2V2yIuhnZonWWev6xHpogDuRZu6OxkY9BH+
 8KKtTSuULAxzw1gkZi2b7r0qFBOc8GsN2phPS/fj/Lz7UnPI0SEX/Fes4AM3G0V8sLRq
 Ehjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l9m6J8uLuxX+INRqQIZYBSnUhzb+TxK1CYMtvNSeIME=;
 b=LY9lmkfELEIweqsJPPMvtlUlQ7gL8UJNxTVd/EuBMgyg/QoV9L+Bm335OIgrJNauzQ
 nF6IdyBWXrJhpZK3hyrYFUo7ZI68n1YetRlxgNrXek70kjJ187q+JECN6Bv7Q8fcUD8U
 Mxuad/G6MzbPxaoxxM/Sa7cuvmZKyLhM0YRab/yV+iEsTAYFpmAn++qY+Xn0MTXMMnEn
 7BLNLKyvxgx8eLySY9m5ksQPszaWtKqeF/+3vC1Tt8hGovv6F2C2wm3mO2HBl3PPfPzO
 MF2GVLvql7ydCTJA0N8gPXUAdR9uzlHccuF8sn82stcTzIl7iwzKQM83dhop2kutBmYp
 7Dsw==
X-Gm-Message-State: AOAM5318yXxPY+PasQTnJhOgtOIuPdIcBaljKWcixwPsu8qji2R6BEQx
 wtffuO4N2DQR4Gk3h2DY2j9MoatlLy8CTZP4yB2GV+cPLcNLfQ==
X-Google-Smtp-Source: ABdhPJw+cB0QJdKjE3atQgIBnIbFyCNrdJgEZ83J67UmUqiC7LEmqKza6ZsqP0GnDAQI7hl9QJwFXJR7INX/pYKlJPk=
X-Received: by 2002:aa7:d510:: with SMTP id y16mr17246812edq.233.1623024444510; 
 Sun, 06 Jun 2021 17:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
 <562c85d7-c1d8-c978-6136-3ca538d12857@samba.org>
 <CAB5c7xqZ3OAB4YJDsU5tj9GAh+j4KiYUz_5wwOG1xeAkFcFH9g@mail.gmail.com>
 <54a0103bb925ebc76a6dd94829349adff7d94863.camel@samba.org>
 <20210601155911.GA4152169@jeremy-acer>
 <CAB5c7xrPC4udy+tTFd6MZPeCqkvQPr-4APVokV+L=K7iJ=hJbw@mail.gmail.com>
In-Reply-To: <CAB5c7xrPC4udy+tTFd6MZPeCqkvQPr-4APVokV+L=K7iJ=hJbw@mail.gmail.com>
Date: Sun, 6 Jun 2021 20:07:13 -0400
Message-ID: <CAB5c7xotNWPudAnn9DwDYzAoGGhWCQ74JrhUOQXpHe9_N8wYfg@mail.gmail.com>
Subject: Re: JSON input / output for CLI utilities
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I made a merge request here (
https://gitlab.com/samba-team/samba/-/merge_requests/1994) for initial
stuff with net_conf (trying to deal with this in bite-sized chunks). Feel
free to give feedback in the MR, on-list, or via personal email :)
