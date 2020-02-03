Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7FF150A56
	for <lists+samba-technical@lfdr.de>; Mon,  3 Feb 2020 16:55:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=7rcjF/IA172q9k6HevTfmd6CEnRCc7FtSaRcqsB57wk=; b=xwkjnjKM1l2EsssQsGxZIttZtY
	K4/oDX3EjS3aV81OzG2E4iUqcizCQxAiJs2Bbklzdc/Frj9r+RfcCHGrQrxn4sMZ3yodMnfGwS83R
	zo01xOOlLdz8hLHgPOWwv4AENt7/f6FDHH3bQBVUJOc6qdbZvqwxtx0xPV8CDhLrhXNimAPsjJEh8
	xPzAIIgGYNIAqzdIjw3b1RaO17JTN1smMxzyXo3EaYoWfNG8sTuVisQqCdW7b9LWS1Rt5t3RO7Bpl
	bqR/WfMVENaSLJqdmQ/t5hH7vmNgL7cpV49peeIC4qh8XIButI2wkqCDFRjPI4m2H9D86i6GMuemW
	HLQA25cA==;
Received: from localhost ([::1]:56868 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iye3F-007wFA-5R; Mon, 03 Feb 2020 15:54:17 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40905
 helo=us-smtp-delivery-1.mimecast.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iye38-007wF3-U1
 for samba-technical@lists.samba.org; Mon, 03 Feb 2020 15:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mathworks.com;
 s=mimecast20180117; t=1580745242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Y6Wm1pcpsMHHHjNjojsyV0bz2CrB7tS0FBIaI3k/E34=;
 b=MfqWijuSy6GLMMewuvteerVjJzdGcwI1m0AP8h2Mgi9gb/ELIS6mtE7IOA93c7FJvd7rCQ
 XD73MecvN6FqcjRx4dw5fC81YB4DCutT6iyhDzGxsWZbGIV+WKbwjA8wV5ofbKxhXe4TYh
 JTVQcSoICdDhtCujIsAq6wmPOkUTtAw=
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-D1_IKLszNhOdE-4pl9qLYA-1; Mon, 03 Feb 2020 10:51:50 -0500
Received: from BL0PR05MB5602.namprd05.prod.outlook.com (10.167.234.91) by
 BL0PR05MB5108.namprd05.prod.outlook.com (20.177.242.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.12; Mon, 3 Feb 2020 15:51:49 +0000
Received: from BL0PR05MB5602.namprd05.prod.outlook.com
 ([fe80::134:f152:1862:7b8d]) by BL0PR05MB5602.namprd05.prod.outlook.com
 ([fe80::134:f152:1862:7b8d%6]) with mapi id 15.20.2707.018; Mon, 3 Feb 2020
 15:51:49 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: smbd notifyd daemon memory leaking
Thread-Topic: smbd notifyd daemon memory leaking
Thread-Index: AdXaqcYC/k6wrTOBSfGmGyWTEsCbDA==
Date: Mon, 3 Feb 2020 15:51:48 +0000
Message-ID: <BL0PR05MB5602048B42B79219C7591241BF000@BL0PR05MB5602.namprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [144.212.128.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 440c32f0-fbd2-4ca9-aec9-08d7a8c0fabc
x-ms-traffictypediagnostic: BL0PR05MB5108:
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jC4jJ/ASqAMn8UYjFU8EGMrFwW616gnHIoPxYC4UKTNMaoB7ZPBw8aH6d92RqiU3d0p7v0eZw5SVJYCytkHZOd4ToR6zGNlo+Y9H1t6dpF4Ehv/CUSZntTGipq6T6Q6pHzCzoduTYitokPRvi2AQDe5/tC3hGalQRjisNd135+9Maphyn4usVhH/akHJ+uXk0Q9oZ5CvcDrnOwEjTq4Lhhgf96dOZY2RNMOMrSGurwv7UBEtcpSXDFqFGFkTTdJNDQb5IHvzWyV3GNmrlg4nGNdimTzl7vFceAaFudt5uhcMAJYQ1vFtR2x8t0NRLmKWXQoyQTqNmKVt8EyQEoPlzIkAS5/pcKyRu9PkiuDjTivD8cmN7hFrHDXV0wN0MgTkkNZPjyZVek1wAOWJmiy+5DEDX6+BBTw7MwnhnhaBzZjiJh4J1RZ4AfpHeuhi3EYV
x-ms-exchange-antispam-messagedata: 9Qf0eO7hj9R7OZyA50yPud9w29b1VIcR4yPnrQLI0b4If18mWags11pO/Z4/oaxGUDSH7jHWb+cjtWm6mzyKXXtaSgmDh6N00GrydYnJN2jP4c5xaZ/ZiDJ2Dfl4r0j8wl8Wc8SbZBSlP1DSdFisfQ==
MIME-Version: 1.0
X-OriginatorOrg: mathworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440c32f0-fbd2-4ca9-aec9-08d7a8c0fabc
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 99dd3a11-4348-4468-9bdd-e5072b1dc1e6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cCamimKcYEqKf+bI1lbjdBS0DJ1tg9hmnLDf5wEwsh4TZHlY1a1rHTkywSZnRedLM4Hf3mw5tJJdousgkyPZDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR05MB5108
X-MC-Unique: D1_IKLszNhOdE-4pl9qLYA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: mathworks.com
X-Warn: EHLO/HELO not verified: Remote host 207.211.31.81
 (us-smtp-2.mimecast.com) incorrectly presented itself as
 us-smtp-delivery-1.mimecast.com
Content-Type: text/plain; charset=WINDOWS-1252
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
From: Youzhong Yang via samba-technical <samba-technical@lists.samba.org>
Reply-To: Youzhong Yang <yyang@mathworks.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello folks,

We have Samba 4.9.4 running on a bunch of servers, occasionally on some ser=
vers, the notifyd daemon process started to use lots of memory. Yesterday o=
n one of our servers, it used 270G of memory.

I ran dtrace on the smbd/notifyd process, as you can see, the memory alloca=
tion calls are far more than memory free calls.

Does this ring a bell to you? Is this a known issue?

Thanks for your attention,

-yyang

# dtrace -n 'pid$target::umem_alloc:entry,pid$target::umem_free:entry {@[us=
tack()] =3D count();} tick-60s {exit(0);}' -p 6369
dtrace: description 'pid$target::umem_alloc:entry,pid$target::umem_free:ent=
ry ' matched 3 probes
CPU     ID                    FUNCTION:NAME
12  94612                        :tick-60s


              libumem.so.1`umem_free
              libumem.so.1`process_free+0x145
              libumem.so.1`umem_malloc_free+0x1d
              libtalloc.so.2.1.14`_tc_free_internal+0x3ea
              libtalloc.so.2.1.14`_talloc_free_internal+0x9d
              libtalloc.so.2.1.14`_talloc_free+0x105
              libsmbconf.so.0`messaging_post_main_event_context+0x1c7
              libtevent.so.0.9.37`tevent_common_invoke_immediate_handler+0x=
184
              libtevent.so.0.9.37`tevent_common_loop_immediate+0x37
              libtevent.so.0.9.37`epoll_event_loop_once+0x8f
              libtevent.so.0.9.37`std_event_loop_once+0x5c
              libtevent.so.0.9.37`_tevent_loop_once+0x102
              libtevent.so.0.9.37`tevent_req_poll+0x25
              smbd`smbd_notifyd_init+0x28c
              smbd`main+0xf67
              smbd`_start_crt+0x83
              smbd`_start+0x18
                3

              libumem.so.1`umem_alloc
              libumem.so.1`umem_malloc+0x3f
              libtalloc.so.2.1.14`__talloc_with_prefix+0x138
              libtalloc.so.2.1.14`_talloc_pool+0x2c
              libtalloc.so.2.1.14`_talloc_pooled_object+0xc1
              libsmbconf.so.0`messaging_rec_dup+0x72
              libsmbconf.so.0`messaging_rec_create+0x228
              libsmbconf.so.0`messaging_post_self+0x54
              libsmbconf.so.0`messaging_send_iov_from+0x11f
              libsmbd-base-samba4.so`notifyd_send_delete+0xed
              libsmbd-base-samba4.so`notifyd_trigger_parser+0x3b9
              libdbwrap-samba4.so`db_rbt_parse_record+0x76
              libdbwrap-samba4.so`dbwrap_parse_record+0x55
              libsmbd-base-samba4.so`notifyd_trigger+0x3c2
              libsmbconf.so.0`messaging_dispatch_classic+0xda
              libsmbconf.so.0`messaging_post_main_event_context+0x13c
              libtevent.so.0.9.37`tevent_common_invoke_immediate_handler+0x=
184
              libtevent.so.0.9.37`tevent_common_loop_immediate+0x37
              libtevent.so.0.9.37`epoll_event_loop_once+0x8f
              libtevent.so.0.9.37`std_event_loop_once+0x5c
             9163

