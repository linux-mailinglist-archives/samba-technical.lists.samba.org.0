Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD8EB9CB80
	for <lists+samba-technical@lfdr.de>; Thu, 25 Sep 2025 01:52:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=nWTEzQuZmIA6Yw3rGAsc52g9L+g+cEXESgDvlaREOG0=; b=0sA37FZjC0cFmrUUioCmyZG5nj
	YJM/sd89joIovt27+eFc2qdDrMR5TiHFyIbzz2PUSTbwKnqFCcHtU+XXIjVTKUFpd3F/mlxjB9hT0
	GbH/OZ2z8nCzrRBiTcVI+UrG9yAoT/ytNbyOcLaFKDriiy/ByE43f2OsFJcMPJhIwsg+F6oBjM5xf
	WLuma9ySQ0sKcfmMAL1NIuUr18xbgwvH30seuKmLYfOH1mxiZXelp0aGbSyHNXWS+CV9xVWEtl2F2
	czdyMN8Zyv/80AIbZQhyjko8mtWT71gpGUmK53eh5ci2mGDzxDM8dGilNZzxSipkG1PXuj4hGtssk
	x8aev7MA==;
Received: from ip6-localhost ([::1]:56962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v1ZGi-004hCU-V3; Wed, 24 Sep 2025 23:51:29 +0000
Received: from mail2.networkradius.com ([184.95.211.25]:47180) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v1ZGd-004hCH-H6
 for samba-technical@lists.samba.org; Wed, 24 Sep 2025 23:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=freeradius.org; s=sep2024; h=To:Message-Id:Subject:Date:Mime-Version:
 Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nWTEzQuZmIA6Yw3rGAsc52g9L+g+cEXESgDvlaREOG0=; b=piezMG4E015B6Xgdg75AivDJci
 dbj1krcxnJRm0vvgvJiM05aV1Tw4y3FsUobUfJ/Bpavvu47K9Qb3gIieHyTW3G8kHRd+rypr91B17
 1hxy89cx31fnPQSMUiDWkVYmGrRqgn6Q6LBAEDnvyGYETTeKFOZ2tnVLii3UzyKwpK4GUYbaHs/3C
 9BL/eQ3JuYpxzRhXVOWoaQT0DRsDo4qztvEAuXmon4qUJgxlB+FXHQho8JFigMPa1mNKAcHHO/ctX
 JGJdReXXDPfJGlPHqioBKbg7OMj8Ov/Um31tB8bLTD2VZuWNCYc5PtU5Ez0g2AjW8C3q8G5bt1YmZ
 3gvDQu8w==;
Received: from mail.servers.fr.internal.networkradius.com
 ([192.168.42.56]:42872 helo=mail.networkradius.com)
 by mail2.networkradius.com with esmtp (Exim 4.93)
 (envelope-from <a.cudbardb@freeradius.org>)
 id 1v1Yr1-001zi2-5z; Wed, 24 Sep 2025 23:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeradius.org;
 s=sep2024; t=1758756295;
 bh=nWTEzQuZmIA6Yw3rGAsc52g9L+g+cEXESgDvlaREOG0=;
 h=From:Date:Subject:To:From;
 b=NDZbTSSeLanmQxoOZgFkVFOb1NYBhuXabyIgx/950s+U4+B8/IRHm5kkbcIm9IzkS
 NPGcd9ykre+qyfs3W1Sew//7Ak9IKW44OxSO2Kb/LBUKJ/VOjQooaxlG7202McLY/J
 WFPs1NKcqq5xWQtAOeaNPpxLzk92JZgtLK2w0X/bPw/OOECCxml6ezHJxQiCC+A8gU
 yMdrlNeDErEAA6s6oXQRpf8egp4lAUVXvSYLfHPeLgiw6PAP2Nv/1rWZlmP8bYUcMV
 UMMcimdPa81gmssElQw6HsBd+lfIlyNlW8maMq5E8hwdQhAv551GiASwMsqhOeJnf+
 +NNsKyi2y1TWw==
Received: from smtpclient.apple (198-84-232-110.cpe.teksavvy.com
 [198.84.232.110])
 by mail.networkradius.com (Postfix) with ESMTPSA id 447B858A;
 Wed, 24 Sep 2025 23:24:54 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Date: Wed, 24 Sep 2025 19:24:42 -0400
Subject: Proposal for adding async capabilities to libwbclient
Message-Id: <2C00FBA9-04BC-4680-B955-CFAD06B364E4@freeradius.org>
To: samba-technical@lists.samba.org
X-Mailer: Apple Mail (2.3826.700.81)
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
From: Arran Cudbard-Bell via samba-technical <samba-technical@lists.samba.org>
Reply-To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

There's currently a hardcoded 5 second timeout on all read/write calls =
in libwbclient.

If winbindd becomes unresponsive for any reason, the calling process =
will block repeatedly for 5 second periods.  As a user of libwbclient, =
we don't like to block for 5 second intervals, it prevents us processing =
requests that don't need to call winbindd.

We could submit a patch to make the timeout value configurable, but we'd =
like to do the right thing and fix the blocking behaviour.  This is a =
high(ish) level proposal for how we propose doing that.

## Moving request state off the stack

The majority of functions in the public API call wbRequestResponse with =
a request structure and response structure.

Inputs to this function are:
- ctx containing the configuration and handle for the socket if it's =
been previously opened
- req_type
- request - any arguments for the request
- response - the result of processing the response

The function also returns NSS_STATUS to indicate the status of the =
request.

There's no synchronisation around struct wbcContext (ctx) currently, =
meaning there's no expectation that multiple requests can be in flight =
over the same connection to winbindd.

We'd propose creating a new structure:

struct wbcRequest {
	int cmd;
	struct winbindd_request *request;
	struct winbindd_response *response;
	NSS_STATUS ret;
};

...and adding this to the existing wbcContext structure:

struct wbcContext {
	struct winbindd_context *winbindd_ctx;
	struct wbcRequest *wbc_request;

	uint32_t pw_cache_size; /* Number of cached passwd structs */
	uint32_t pw_cache_idx;  /* Position of the pwent context */
	uint32_t gr_cache_size; /* Number of cached group structs */
	uint32_t gr_cache_idx;  /* Position of the grent context */
};

Calls to wbcRequestResponse would allocate a new wbcRequest and set the =
wbc_request field in the wbcContext structure.  Calling =
wbcRequestresponse with a non-null wbc_request field would error.

This moves the state of the request onto the heap.

## Integrating with external event loops

libcurl has a reasonable approach to event loop integration, wbclient =
could follow the same general pattern:

typedef enum {
    WBC_POLL_IN    =3D 0x01,
    WBC_POLL_OUT   =3D 0x02,
    WBC_POLL_INOUT =3D WBC_POLL_IN | WBCM_POLL_OUT,
    WBC_POLL_REMOVE=3D 0x04
} wbc_poll_what_t;

Event callback would be set with:

typedef int (*wbc_event_cb)(
    struct wbcContext *wbc,
    int            fd,     /* the socket to monitor */
    int            what,   /* one of WBC_POLL_IN, WBC_POLL_OUT, =
WBC_POLL_INOUT, WBC_POLL_REMOVE */
    void          *uctx  /* user pointer */
);

wbcErr wbcCtxSetEventCallback(wbc_event_cb func, void *uctx);

Timer callback would be set with:

typedef int (*wbc_timer_cb)(
    struct wbcContext *wbc,
    long    timeout_ms, /* timeout in milliseconds; -1 means disarm */
    void   *uctx       /* user pointer */
);

wbcErr wbcCtxSetTimerCallback(wbc_timer_cb func, void *uctx);

wbcEvent(struct wbcContext *wbc, wbc_poll_what_t what)
wbcEventTimer(struct wbcContext *wbc)

This replaces the internal poll calls, and triggers reads/writes and =
timeouts as appropriate from the user's event loop.

## Modifying the public API

All functions in the public API return a wbcErr value, and emit data via =
output **args.  This means very few changes need to be made to the =
public API in order to support asynchronous behaviour, we just need to =
store output pointer values in a structure associated with the =
wbcRequest.  This would likely be a union containing structures that =
represent the output arguments for each public function.

A new enum value: WBC_ERR_ASYNC_YIELD would be added to the _wbcErrType =
enum.  This would be returned by the wbcCtx* functions in the public =
API, where async callbacks had been configured.

The user would set a completion callback to be notified of the result of =
the operation:

typedef int (*wbc_done_cb)(
    struct wbcContext *wbc,
    wbcErr err /* result of the async operation */
    void   *uctx       /* user pointer */
);

wbcCtxSetDoneCallback(wbc_done_cb functions, void *uctx)

The pointers they'd passed in as output arguments would then be =
guaranteed to either be NULL on error, or pointing to valid memory =
filled with the result of the operation.

All wbcCtx* functions would be split into two.  One part to create the =
request, the other to process the response.  The response function could =
be added as a pointer to the wbcRequest.

## Wrapping up

This is not intended to be a complete design, but only to gauge =
interest. There's no minimally invasive way to make libwbclient async, =
but this approach at least preserves the public API as it is today. =20

If we submitted patches that roughly followed the above proposed design, =
and preserved current synchronous behaviour, are they likely to be =
merged?
Are there any other examples of similar integrations within the samba =
project that we could base our efforts on?

Many Thanks,
-Arran

Arran Cudbard-Bell <a.cudbardb@freeradius.org>
FreeRADIUS core development team
FD31 3077 42EC 7FCD 32FE 5EE2 56CF 27F9 30A8 CAA2


