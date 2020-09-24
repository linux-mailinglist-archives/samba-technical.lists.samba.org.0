Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28C277442
	for <lists+samba-technical@lfdr.de>; Thu, 24 Sep 2020 16:46:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=CHz/AtsjClWsIqbBKlFxE13Vqorlq8OVg9mmhYPdbEU=; b=DAVx18CwSyq3JHNTLzVG8/841J
	LCc+BujQtqdSqAw2ubEsTYgOZSZp77jkhRm69LA6iIDxVTdBT+jPeYNtmQ4prV9hASbJ6C1Z4/ZWg
	JJzVbCFPirS1h5p4mI3FwJAf+jahtprGDLKDC83LMKuFh76kjqZlHMu6LQjRGGLexXHaLUVV6PuGa
	TmabS9W5PxMdfkH/K35crtDqe7pGX9SJ2PKgVIkONjqBNULkjPa5uHzPD7SLyPZiHrKe8poXaZmfW
	f/SeP6vbkwT3uRpRbFyb7Z2inPnJw3IxQO2hPqS6pBPayHldfb4wmfBmpzrjDO1Os8pyZBrJId0gz
	QUi+eQvg==;
Received: from ip6-localhost ([::1]:45124 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kLSVL-0076JD-Pm; Thu, 24 Sep 2020 14:45:51 +0000
Received: from mail-dm6nam12on2044.outbound.protection.outlook.com
 ([40.107.243.44]:61307 helo=NAM12-DM6-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kLSVD-0076J6-OX
 for samba-technical@lists.samba.org; Thu, 24 Sep 2020 14:45:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMhrIuhH9ywOyxdoVDRCJ8cfbp8SAB3sGQB7/0BqiLGtvgdivOqr4+mu5CftWPNMFucfBAMVQLtFQc0pZralpV3T06I8W/M6qXk20ygzFEU5/CCJ0w1a7mhVZMhIqEa59Z1SZEukTfG8qQXCUQMLuko5u7l7bwaKk9NILi7QZbdgGzt5T6UMhC/z4KItblM1b/GLmpRmHCbQ1Y6xG1ifY5Uixq4nQGLjAVizZvjWX/egnfWk7SlaviDq22D8EqvDZZDffRssKxNcsUN0nDyMDGkeo73ykfwrRYxVcuggRfffiNre87Wa+h6LLkpGCvbhtLQtzY6t37/Sq/s1V//zSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO5yTvQmb8j1GO+bTNLurfBDbdiIARO1KqBZrtuez3U=;
 b=hRi46p4TS60Tx9EEH+ss4v4tzJBxy4K+pzO16IDK93t9oJX/mXMImo9nlNVVlsdh7k5Mwulj8o5HZi/IR4rcJZoEY8VBajcjh4Gu8F+snYrk5Db6kstYd/mvqaBW3zIVVvg6TAtisZmkjuRqch7uGJWnm+KSWjXCYpLOR2v90VjyFjHCn5JOuXlwCM8i8LxpvLB3ggK5AmUFo635cWxmdq5+BlW1bB+5shv8jUWNJx8g+dhKMtAdqeBP4jyS9BBYo+5OENJiLHjibL+gVrhyxH9DfUmpGlGrc5Az0w8vMoZIAOj1tDlvT4toJTbLfix/E8nIKcjFKaUOMGK0B33GOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nasuni.com; dmarc=pass action=none header.from=nasuni.com;
 dkim=pass header.d=nasuni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nasuni.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO5yTvQmb8j1GO+bTNLurfBDbdiIARO1KqBZrtuez3U=;
 b=ODolV/DdHHjhbRPWvtPJ59xGK1lXhIGU2cOskW0uCt7kVUEivTiZePMuB+pMKh/i50K8TRPuwdL3uXl1SlBSWfDE1JCmL5RN88DawYENJ3WG+d2I0C7UY3OqefbrlTCyPhlPR2VnvCOW1X5WePkLU2syTthH6MDqfweJdoP2tNQLVxwsmMQK6xaIL55SmKQkxxOEnPBQfYhJZdn6OB1eL/lEZWjIPMpKo6WMeCNcq5uiouC0MTvRZ8DW4yvRBncVVbJUsZR+iOTM/ne3mm7S8Lx8kre9vYVNLek5crJAEk/4jlxOlB9vtBz+N/JyOdJVlvzXQrSEfMm/YNOP5DxgIg==
Received: from BN7PR07MB4402.namprd07.prod.outlook.com (2603:10b6:406:b0::10)
 by BN8PR07MB5922.namprd07.prod.outlook.com (2603:10b6:408:6d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Thu, 24 Sep
 2020 14:44:53 +0000
Received: from BN7PR07MB4402.namprd07.prod.outlook.com
 ([fe80::bdbc:1760:659e:4f1d]) by BN7PR07MB4402.namprd07.prod.outlook.com
 ([fe80::bdbc:1760:659e:4f1d%6]) with mapi id 15.20.3412.020; Thu, 24 Sep 2020
 14:44:53 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Need tips on debugging assert_no_pending_aio() cores
Thread-Topic: Need tips on debugging assert_no_pending_aio() cores
Thread-Index: AdaSaJtzgtwusV9cS9a5sMXEkASw0Q==
Date: Thu, 24 Sep 2020 14:44:53 +0000
Message-ID: <BN7PR07MB4402C07BF8C5EB753481AD53CF390@BN7PR07MB4402.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.samba.org; dkim=none (message not signed)
 header.d=none; lists.samba.org; dmarc=none action=none header.from=nasuni.com; 
x-originating-ip: [2600:1700:723:8640:7542:b96f:1cdd:7a4c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52c79d9f-0305-448f-71ae-08d8609865f4
x-ms-traffictypediagnostic: BN8PR07MB5922:
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JsgWTJZMy7PKq/KSiUqiM3S0tS+2qq4nbwKCpLxg/CWPch65Tj94DW9BTcREQTyebGScOIb0q4hecRpvuyXhwN3g8iSQ1y5TbuC9z0c15hZfKvHJdMPbltaTWBq9K+KD1wZlZAEmgLGKES2MjdUOhKuICY58lR0xXi7J9hv9P0u0OWJHkp3ZjFCDXLzcdXOxlgYV2bwEZUhiDNsroJNahNQq238o24CJOVqmLaAqY3NL07YZyXDVN4LKiMhhzldtSejAJAsel+89pIcSUW/8eRXO0qBS7oK8lUNx1u3wSbnxqjX5KImu0apeyusjb4uvE4QWPhOaFDxE2q+AKSY/MprlMFa279F4qL68eGqQi4syuljc2Yc8UO/lnsFVUziSMtqcvouH00omxdiNMNrWwskWUmoMYxBdlZFeXYwh6kF+SLJpQsF0DO5fwaZjHHkHr9afNRm3vBlXcgg5vovTXQ==
x-ms-exchange-antispam-messagedata: 584CJkhRgFIt+rKTnxtHnZUpmxUJuLEGJYVUsZ14TeNE8b4SpXbmGpOa+cLLE8iJXw/kAP3xRlntBTaMEtK+yfkS3CoErVUt4ON05TN/RRTOiGbGmGCIJ82nGHlKeFROAmEh69ertwqiKOAiDH/dkn82tmdRVJ/ONwkUdoFABpBTWUmD0FFNqgpggzoXVhyGJNzkntLxCm/IGyQexnbNvO/lI4jo2F1nFq6gy/eKwgqQAZaRUd6R7YzDPMxImQjEDjyiTAQ1WsQ1vHlzHatxLMMzwlRDf8YBQ4lZHKR0Y1a63H2ZjYkzM99SKMT8ImGaBUxl5U2DYQCCxcovk/j4hCCENaBwIT0IEp61gIJIdyo5bU6HcPqm25/KdBM+XCQMjQlDfZ0Yr2hVs/JaAmTiRjuexYzmBJqTeUmsoW6LVoK+N9bPJzKaRRB1ifjJU7a5ZL8Z9ZanzSQV9qj+bqt4V5pJ4pU5gGCxkrhjdKRdxTFi7SRq8pi2u7TqEfMmmhAZkb9dnk3AEp8mRyGMKF/Vd07IJS+DzYr62m2PgnnmCKYpEDZmMwkzsCufWlCZmw89TmB1U0GFF8rzJYdEsMp8RSETBtJklawvCB6l09zZDBdLuLBhVazan91TE/1DKdVymh8P63PhY1LhLxQfR2A9gWbUgbB/AOt8Zgfnx2RPy4HgMdQEKcdEUMgYkdBptAu9q211TLOf/JV9HwSmNlErSw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nasuni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR07MB4402.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c79d9f-0305-448f-71ae-08d8609865f4
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 146173a2-cdda-476f-b6d5-a48c6e6dd0c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LewyTOOp2FqG+NBsRUDG2YnWB1uyPdA5DBNLQ2ryKPNbGJ7z76/VMf3HIpBDjgP66iJp3IbO3y0JxntaxAlu76Um63dpoYrvxYeK68UJJ6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB5922
X-Warn: EHLO/HELO not verified: Remote host 40.107.243.44
 (mail-dm6nam12on2044.outbound.protection.outlook.com) incorrectly presented
 itself as NAM12-DM6-obe.outbound.protection.outlook.com
Content-Type: text/plain; charset="us-ascii"
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
From: Ashok Ramakrishnan via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi:
We use Samba on top of our user space (fuse) file system. We just recently =
updated to samba 4.12.6 (still in pre-release testing internally) and we ar=
e running into these smbd cores after very heavy IO load. On looking at the=
 core, I see that there seems to be a race (or a mismatch) between the num_=
aio_requests accounting and the actual requests linked to the fsp structure=
 (fsp->aio_requests)... Since we are on 4.12.6, we already have the fixes f=
or https://bugzilla.samba.org/show_bug.cgi?id=3D14301. My question is, how =
do I debug this issue further? Is it just code inspection, adding additiona=
l debug logging? Or is there a better way?

Also, I could use some help understanding this code block in aio_del_req_fr=
om_fsp()
        if (i =3D=3D fsp->num_aio_requests) {
                DEBUG(1, ("req %p not found in fsp %p\n", req, fsp));
                return 0;
        }
Why is it OK to not find an aio request attached to the fsp while destructi=
ng it? Is there a valid use case where this is expected to happen? I am not=
 sure we are running into the above code block, plan to set log level 1 to =
see if that is the case.. Just noticed this during code inspection and tryi=
ng to understand the logic there.

Thanks in advance for any tips/pointers.

-Ashok



(gdb) fr 8

#8  0x00007f295ff32098 in assert_no_pending_aio (close_type=3Dclose_type@en=
try=3DSHUTDOWN_CLOSE, fsp=3D<optimized out>, fsp=3D<optimized out>) at ../.=
./source3/smbd/close.c:669

669                             TALLOC_FREE(fsp->aio_requests[0]);

(gdb) p fsp

$1 =3D <optimized out>

(gdb) p num_requests

$2 =3D 1

(gdb) fr 10

#10 close_file (req=3Dreq@entry=3D0x0, fsp=3D0x55ab4c315610, close_type=3Dc=
lose_type@entry=3DSHUTDOWN_CLOSE) at ../../source3/smbd/close.c:1277

1277                    status =3D close_normal_file(req, fsp, close_type);

(gdb) p fsp

$3 =3D (files_struct *) 0x55ab4c315610

(gdb) p fsp->aio_requests

$4 =3D (struct tevent_req **) 0x0

(gdb)


#0  0x00007f295eb17337 in raise () from /lib64/libc.so.6
#1  0x00007f295eb18a28 in abort () from /lib64/libc.so.6
#2  0x00007f29602320d9 in dump_core () at ../../source3/lib/dumpcore.c:338
#3  0x00007f2960241a08 in smb_panic_s3 (why=3D0x7f29602bfc5c "internal erro=
r")
    at ../../source3/lib/util.c:853
#4  0x00007f29602b37bd in smb_panic (
    why=3Dwhy@entry=3D0x7f29602bfc5c "internal error")
    at ../../lib/util/fault.c:174
#5  0x00007f29602b3a1e in fault_report (sig=3D<optimized out>)
    at ../../lib/util/fault.c:88
#6  sig_fault (sig=3D11) at ../../lib/util/fault.c:99
#7  <signal handler called>
#8  0x00007f295ff32098 in assert_no_pending_aio (
    close_type=3Dclose_type@entry=3DSHUTDOWN_CLOSE, fsp=3D<optimized out>,
    fsp=3D<optimized out>) at ../../source3/smbd/close.c:669
#9  0x00007f295ff32cbf in close_normal_file (close_type=3DSHUTDOWN_CLOSE,
    fsp=3D0x55ab4c315610, req=3D0x0) at ../../source3/smbd/close.c:695
#10 close_file (req=3Dreq@entry=3D0x0, fsp=3D0x55ab4c315610,
    close_type=3Dclose_type@entry=3DSHUTDOWN_CLOSE)
    at ../../source3/smbd/close.c:1277
#11 0x00007f295fecb9f5 in file_close_user (sconn=3Dsconn@entry=3D0x55ab4c2d=
4440,
    vuid=3D1512462701) at ../../source3/smbd/files.c:257
#12 0x00007f295ff7eefd in smbXsrv_session_logoff (session=3D0x55ab4c322610)
---Type <return> to continue, or q <return> to quit---
    at ../../source3/smbd/smbXsrv_session.c:1671
#13 0x00007f295ff7f1c6 in smbXsrv_session_clear_and_logoff (
    session=3D<optimized out>) at ../../source3/smbd/smbXsrv_session.c:1192
#14 0x00007f295ff7f2a2 in smbXsrv_session_logoff_all_callback (
    local_rec=3Dlocal_rec@entry=3D0x7fff6a9379b0,
    private_data=3Dprivate_data@entry=3D0x7fff6a937a90)
    at ../../source3/smbd/smbXsrv_session.c:1820
#15 0x00007f295e0ad241 in db_rbt_traverse_internal (
    db=3Ddb@entry=3D0x55ab4c320550,
    f=3Df@entry=3D0x7f295ff7f250 <smbXsrv_session_logoff_all_callback>,
    private_data=3Dprivate_data@entry=3D0x7fff6a937a90,
    count=3Dcount@entry=3D0x7fff6a937a44, rw=3Drw@entry=3Dtrue)
    at ../../lib/dbwrap/dbwrap_rbt.c:456
#16 0x00007f295e0ad3da in db_rbt_traverse (db=3D0x55ab4c320550,
    f=3D0x7f295ff7f250 <smbXsrv_session_logoff_all_callback>,
    private_data=3D0x7fff6a937a90) at ../../lib/dbwrap/dbwrap_rbt.c:514
#17 0x00007f295e0ab8aa in dbwrap_traverse (db=3D<optimized out>,
    f=3Df@entry=3D0x7f295ff7f250 <smbXsrv_session_logoff_all_callback>,
    private_data=3Dprivate_data@entry=3D0x7fff6a937a90,
    count=3Dcount@entry=3D0x7fff6a937a8c) at ../../lib/dbwrap/dbwrap.c:377
#18 0x00007f295ff7f437 in smbXsrv_session_logoff_all (
   client=3Dclient@entry=3D0x55ab4c310c30)
    at ../../source3/smbd/smbXsrv_session.c:1774
#19 0x00007f295ff84a9a in exit_server_common (
    how=3Dhow@entry=3DSERVER_EXIT_NORMAL,
    reason=3D0x7f295fb1b4c9 "NT_STATUS_CONNECTION_RESET")
    at ../../source3/smbd/server_exit.c:159
#20 0x00007f295ff84f50 in smbd_exit_server_cleanly (
    explanation=3D<optimized out>) at ../../source3/smbd/server_exit.c:266
#21 0x00007f2960121ac4 in exit_server_cleanly (
    reason=3Dreason@entry=3D0x7f295fb1b4c9 "NT_STATUS_CONNECTION_RESET")
    at ../../source3/lib/smbd_shim.c:121

#22 0x00007f295ff5c630 in smbd_server_connection_terminate_ex (
    xconn=3D0x55ab4c2fb3a0, reason=3D0x7f295fb1b4c9 "NT_STATUS_CONNECTION_R=
ESET",
    location=3Dlocation@entry=3D0x7f296004f380 "../../source3/smbd/smb2_set=
info.c:161") at ../../source3/smbd/smb2_server.c:1143
#23 0x00007f295ff781c0 in smbd_smb2_request_setinfo_done (
    subreq=3D0x55ab4c3179d0) at ../../source3/smbd/smb2_setinfo.c:160
#24 0x00007f295ff5d7a7 in smbd_smb2_request_pending_queue (
    req=3Dreq@entry=3D0x55ab4c316340, subreq=3Dsubreq@entry=3D0x55ab4c3179d=
0,
    defer_time=3Ddefer_time@entry=3D500) at ../../source3/smbd/smb2_server.=
c:1420
#25 0x00007f295ff78d91 in smbd_smb2_request_process_setinfo (
    req=3Dreq@entry=3D0x55ab4c316340) at ../../source3/smbd/smb2_setinfo.c:=
122
#26 0x00007f295ff5f3aa in smbd_smb2_request_dispatch (
    req=3Dreq@entry=3D0x55ab4c316340) at ../../source3/smbd/smb2_server.c:2=
792
#27 0x00007f295ff60aac in smbd_smb2_request_dispatch_immediate (
---Type <return> to continue, or q <return> to quit---
    ctx=3Dctx@entry=3D0x55ab4c2e1e40, im=3Dim@entry=3D0x55ab4c3178f0,
    private_data=3Dprivate_data@entry=3D0x55ab4c316340)
    at ../../source3/smbd/smb2_server.c:3137
#28 0x00007f295f0d3039 in tevent_common_invoke_immediate_handler (
    im=3D0x55ab4c3178f0, removed=3Dremoved@entry=3D0x0)
    at ../../tevent_immediate.c:166
#29 0x00007f295f0d3060 in tevent_common_loop_immediate (
    ev=3Dev@entry=3D0x55ab4c2e1e40) at ../../tevent_immediate.c:203
#30 0x00007f295f0d8e9d in epoll_event_loop_once (ev=3D0x55ab4c2e1e40,
    location=3D<optimized out>) at ../../tevent_epoll.c:918
#31 0x00007f295f0d70d7 in std_event_loop_once (ev=3D0x55ab4c2e1e40,
    location=3D0x7f296003d770 "../../source3/smbd/process.c:4170")
    at ../../tevent_standard.c:110
#32 0x00007f295f0d231d in _tevent_loop_once (ev=3Dev@entry=3D0x55ab4c2e1e40=
,
    location=3Dlocation@entry=3D0x7f296003d770 "../../source3/smbd/process.=
c:4170")
    at ../../tevent.c:772
#33 0x00007f295f0d257b in tevent_common_loop_wait (ev=3D0x55ab4c2e1e40,
    location=3D0x7f296003d770 "../../source3/smbd/process.c:4170")
    at ../../tevent.c:895

#34 0x00007f295f0d7077 in std_event_loop_wait (ev=3D0x55ab4c2e1e40,
    location=3D0x7f296003d770 "../../source3/smbd/process.c:4170")
    at ../../tevent_standard.c:141
#35 0x00007f295ff4e844 in smbd_process (ev_ctx=3Dev_ctx@entry=3D0x55ab4c2e1=
e40,
---Type <return> to continue, or q <return> to quit---
    msg_ctx=3Dmsg_ctx@entry=3D0x55ab4c2d45f0, sock_fd=3Dsock_fd@entry=3D38,
    interactive=3Dinteractive@entry=3Dfalse) at ../../source3/smbd/process.=
c:4170
#36 0x000055ab4bb20ce8 in smbd_accept_connection (ev=3D0x55ab4c2e1e40,
    fde=3D<optimized out>, flags=3D<optimized out>, private_data=3D<optimiz=
ed out>)
    at ../../source3/smbd/server.c:1012
#37 0x00007f295f0d2bd3 in tevent_common_invoke_fd_handler (
    fde=3Dfde@entry=3D0x55ab4c308090, flags=3D<optimized out>,
    removed=3Dremoved@entry=3D0x0) at ../../tevent_fd.c:138
#38 0x00007f295f0d90e7 in epoll_event_loop (tvalp=3D0x7fff6a938260,
    epoll_ev=3D0x55ab4c2d4440) at ../../tevent_epoll.c:736
#39 epoll_event_loop_once (ev=3D<optimized out>, location=3D<optimized out>=
)
    at ../../tevent_epoll.c:937
#40 0x00007f295f0d70d7 in std_event_loop_once (ev=3D0x55ab4c2e1e40,
    location=3D0x55ab4bb255f8 "../../source3/smbd/server.c:1359")
    at ../../tevent_standard.c:110
#41 0x00007f295f0d231d in _tevent_loop_once (ev=3Dev@entry=3D0x55ab4c2e1e40=
,
    location=3Dlocation@entry=3D0x55ab4bb255f8 "../../source3/smbd/server.c=
:1359")
    at ../../tevent.c:772
#42 0x00007f295f0d257b in tevent_common_loop_wait (ev=3D0x55ab4c2e1e40,
    location=3D0x55ab4bb255f8 "../../source3/smbd/server.c:1359")
    at ../../tevent.c:895
#43 0x00007f295f0d7077 in std_event_loop_wait (ev=3D0x55ab4c2e1e40,
    location=3D0x55ab4bb255f8 "../../source3/smbd/server.c:1359")
---Type <return> to continue, or q <return> to quit---
    at ../../tevent_standard.c:141
#44 0x000055ab4bb1b4d7 in smbd_parent_loop (parent=3D<optimized out>,
    ev_ctx=3D0x55ab4c2e1e40) at ../../source3/smbd/server.c:1359
#45 main (argc=3D<optimized out>, argv=3D<optimized out>)
    at ../../source3/smbd/server.c:2197

This e-mail message and all attachments transmitted with it may contain pri=
vileged and/or confidential information intended solely for the use of the =
addressee(s). If the reader of this message is not the intended recipient, =
you are hereby notified that any reading, dissemination, distribution, copy=
ing, forwarding or other use of this message or its attachments is strictly=
 prohibited. If you have received this message in error, please notify the =
sender immediately and delete this message, all attachments and all copies =
and backups thereof.
