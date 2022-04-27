Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B5B511C96
	for <lists+samba-technical@lfdr.de>; Wed, 27 Apr 2022 19:26:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=AMIJysOIClyhWI40Frd16XNEy0LkHD61PbPvdqPpKpE=; b=Rq7nwWGeMM3sV9J4Yy29m4Y/Z/
	PKgRyS0k+UCWkkWr+XQX8g+HeRT6CPqcANOVWhACV9LJe7R5KwajpIXQVYjgaZRvXcBvDxywcRk/7
	JICZeKHS2e7ggynhSmaS5WeMreE0OtTwVsz5h3u+Hlm2oC+2v6M3MYxpHTE3LWLKPO3fFsxJAUxuv
	2qlbRI8Y/4aGwDqPtpCFN7gi9Q+zJIxJwiw3uVlR4iHnyZn4A8+iZiDvbR6eTDm41tw2C0d7AlHJw
	8IBn+2MWYldTtHtTt+VDl++EEhMTwITUKDeUQt23CmM8lV9HRKt3ZzcXIpp/cTf/vpryrp4oJDdgJ
	HXzgYPwA==;
Received: from ip6-localhost ([::1]:25302 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1njlQJ-002avC-EL; Wed, 27 Apr 2022 17:25:55 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:46711) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1njlQE-002av3-5Q
 for samba-technical@lists.samba.org; Wed, 27 Apr 2022 17:25:53 +0000
Received: by mail-lj1-x231.google.com with SMTP id 16so3531949lju.13
 for <samba-technical@lists.samba.org>; Wed, 27 Apr 2022 10:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=H41M13ZlLzFGeomWSI5q+bsCsnziMNQVeEHqJ+vLJi8=;
 b=NGEJ9CFKtPP8A88lwx3Ytg6VOMXlfdxl0y5ytSq5q+FpXela3TlFfumVUL0WdGf3aQ
 bbfUVQ2DZlI+oL6E9qvBMMRbheTxGk6blthdRNbiyZaujxQWtnMi21+5wJo1le+eNG6N
 Nc71fwhSzWgxyoaHn9yAyamwUzPV2rAJRAOdP5fiRnFBF8aVVA/6VOXIZBVhPVwQZu0X
 bLbHFNVM+KbzjRycuM0Cf8xlPvV8MK+lWeJLIK7DbpluhT8CKnygn/DX2nHqUvJaVJF6
 R9n0Aes5/lwlTdVwUuewlUbf5FK9yZrInwC4hLhWhiMHSO9VQRTpS7UmkmRAViIGGRVv
 OS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=H41M13ZlLzFGeomWSI5q+bsCsnziMNQVeEHqJ+vLJi8=;
 b=sDp4d3+NL4BXUci5p4fcyppUh31vdW8VdAFCvIdJVHkH3kTqb1M4ST9s6qg4PU98DR
 Kv888cGtMznCbfIL4KN6XrYY6ZokTJz3kQzp1QHSaIvMUbANgimzoFLnwtMSL1etE+Td
 2vK0BbdFr9zkMIcm4bbHdagEjhQQsY9HkyXT3JrRm13j0aJAtwab3eEVZgCSisk70JRi
 OXxjRWhYmgzrJxhegm+0t5q069U7Ty9lJruAi7Sv4Ect1P3hu8hKwa72QWUDRH03pBM4
 vo1TwJ0XTM5GKUXIZnL85kOoPliL6sfSt5jl4Wj0lnOcwtE+yv/XqNed639x9/+6lS7t
 pNZg==
X-Gm-Message-State: AOAM533Y2FrlKk3D1DPgmt496lC4YIOoiaxfOQhb4xx6grPQNNsfTqFG
 jDJ5IysPm9lUYEZZ6tiM7I3d2pGSyN20YAXXc8LahT4stncVsA==
X-Google-Smtp-Source: ABdhPJzowESURDNRucRPZNFL1g9ChJ2luoJb4UPF2hu/TAYjBksStDS1rPhsRUQMJJoqNTATQM2NrDGsZGeklCmrHMc=
X-Received: by 2002:a2e:934f:0:b0:24f:ea1:6232 with SMTP id
 m15-20020a2e934f000000b0024f0ea16232mr12138162ljh.135.1651080348803; Wed, 27
 Apr 2022 10:25:48 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 27 Apr 2022 13:25:37 -0400
Message-ID: <CAB5c7xrKB52rmAP9qPFxzjtCcBLvGsGiUn_ODz7QwQwrJ15o0A@mail.gmail.com>
Subject: ctdb client python bindings
To: samba-technical <samba-technical@lists.samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hey all,

I threw together some quick python bindings for a ctdb client. WIP, but any
feedback would be appreciated (either in-list or direct email to this
address).

I've currently thrown together

https://gitlab.com/samba-team/devel/samba/-/commits/anodos325-ctdb_python_bindings

below are some basic operations
* initializing client
* getting cluster status
* creating a new persistent ctdb file (if that's your thing)
* listing current nodes
* getting pnn0 object and printing its current status

```
>>> import ctdb
>>> cl = ctdb.Client()
>>> cl.status()
{'nodemap': {'node_count': 1, 'deleted_node_count': 0, 'nodes': [{'pnn': 0,
'address': {'type': 'INET', 'address': '192.168.0.92'}, 'flags': [],
'flags_raw': 0, 'partially_online': False, 'this_node': True}]}, 'vnnmap':
{'size': 1, 'generation': 705683446, 'entries': [{'hash': 0, 'lmaster':
0}]}, 'recovery_mode_raw': 0, 'recovery_mode_str': 'NORMAL'}
>>> import os
>>> db = ctdb.Ctdb(cl, "curly.tdb", os.O_CREAT)
>>> db.exists
False
>>> db.attach(ctdb.DB_PERSISTENT)
>>> db.exists
True
>>> db.status()
{'dbid': '0x3c05769c', 'dbid_raw': 1006991004, 'name': 'curly.tdb', 'path':
'/usr/local/samba/var/lib/ctdb/persistent/curly.tdb.0', 'persistent': True,
'replicated': False, 'sticky': False, 'readonly': False, 'flags_raw': 1,
'health': 'OK'}
>>> cl.listnodes()
{'node_count': 1, 'deleted_node_count': 0, 'nodes': [<ctdb.CtdbNode object
at 0x7f013deb95a0>]}
>>> my_node = cl.listnodes()['nodes'][0]
>>> my_node.
my_node.ban(             my_node.disable(         my_node.flags
 my_node.private_address  my_node.unban(
my_node.current_node     my_node.enable(          my_node.pnn
 my_node.rebalance(
>>> my_node.pnn
0
>>> my_node.flags
{'parsed': [], 'raw': 0}
```
