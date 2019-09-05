Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C3384AA0D1
	for <lists+samba-technical@lfdr.de>; Thu,  5 Sep 2019 13:05:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=KLzyJ0zPStYqvyft8Gw49dp99hgxvB4G14diV76app0=; b=bh8utjqCjDczPjuncLN4unHfxK
	Dpj7CMiHPq4K4epLCJbsaLCtN73mEPRtZXP7ugWRXslzu0gnihXwcdKT1MVIZUTObofTNv4NwAvo0
	hb4Rh2GBE+e7bZxP5dk5vBun6oMYgjDqCuW7x1tV3XLpp26ybxrbQAqoBS3j0wEOCH8iVceRUeAvx
	BBw0HLRpsickDr5zU5DO6E3y6k2d9SQZge/ucWtVSChAH7hz2fLu/so2DDUVc1cqPiId4qUcx+1j0
	MGXv6HxLXAGEh94+3IYpykcHD/UfZRuQvHD4fH44mx0u8c0SLu+KxzMLAtakbTPKhn8y47ix4YJsp
	6Rxy3UCA==;
Received: from localhost ([::1]:60854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5pZW-003eUC-Ky; Thu, 05 Sep 2019 11:05:02 +0000
Received: from rs07.intra2net.com ([85.214.138.66]:45740) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i5pZQ-003eU2-JM
 for samba-technical@lists.samba.org; Thu, 05 Sep 2019 11:05:00 +0000
Received: from mail.m.i2n (unknown [172.17.128.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by rs07.intra2net.com (Postfix) with ESMTPS id D5478150027B;
 Thu,  5 Sep 2019 12:45:18 +0200 (CEST)
Received: from localhost (mail.m.i2n [127.0.0.1])
 by localhost (Postfix) with ESMTP id 99F5D7D1;
 Thu,  5 Sep 2019 12:45:18 +0200 (CEST)
Received: from drift.m.i2n (drift.m.i2n [172.16.1.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: smtp-auth-user)
 by mail.m.i2n (Postfix) with ESMTPSA id 76B9E474;
 Thu,  5 Sep 2019 12:45:15 +0200 (CEST)
Date: Thu, 5 Sep 2019 12:45:14 +0200
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: smbstatus json/xml output with libxo
Message-ID: <20190905104514.GA10954@drift.m.i2n>
Mail-Followup-To: Andrew Walker <awalker@ixsystems.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAB5c7xrHU396GnZb_P4adbGFSZA4wvdRFx526n2OXHBCk+FooQ@mail.gmail.com>
 <e14c5e22-5ee7-310d-9f21-77257d53468b@samba.org>
 <CAB5c7xqz-S_yHahSp5onY0N=FqufeDkxhGo=+cHpu-BGyduqRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <CAB5c7xqz-S_yHahSp5onY0N=FqufeDkxhGo=+cHpu-BGyduqRw@mail.gmail.com>
X-Sent-From-My: toaster
User-Agent: Mutt/1.11.2 (2019-01-07)
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
From: Philipp Gesang via samba-technical <samba-technical@lists.samba.org>
Reply-To: Philipp Gesang <philipp.gesang@intra2net.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

I=E2=80=99m not a team member but I like this patch! I=E2=80=99ve given it a
quick test run on our 4.7-series setup and it does its job.

Some remarks about the patch inline below.

-<| Quoting Andrew Walker via samba-technical <awalker@ixsystems.com>, on T=
hursday, 2019-08-29 01:36:59 PM |>-
> On Wed, Apr 17, 2019 at 10:55 AM Stefan Metzmacher <metze@samba.org> wrot=
e:
>=20
> >
> > I think using another library should be avoided, do you really need xml
> > or would you be able to work based on libjansson and only json?
> >
> > metze
> >
> >
> Sorry, it took a while to get around to this. I re-worked it to use
> libjansson per your suggestion.
>
> diff --git a/source3/utils/status.c b/source3/utils/status.c
> index b5d0b5e..84646ce 100644
> --- a/source3/utils/status.c
> +++ b/source3/utils/status.c
> @@ -51,6 +51,12 @@
>  #include "cmdline_contexts.h"
>  #include "locking/leases_db.h"
> =20
> +#ifdef HAVE_JANSSON
> +#include <jansson.h>
> +#include "audit_logging.h" /* various JSON helpers */
> +#include "auth/common_auth.h"
> +#endif /* [HAVE_JANSSON] */
> +
>  #define SMB_MAXPIDS		2048
>  static uid_t 		Ucrit_uid =3D 0;               /* added by OH */
>  static struct server_id	Ucrit_pid[SMB_MAXPIDS];  /* Ugly !!! */   /* add=
ed by OH */
> @@ -64,9 +70,13 @@ static bool processes_only;
>  static bool show_brl;
>  static bool numeric_only;
>  static bool do_checks =3D true;
> +static bool json_output =3D false;
> +static bool resolve_uids =3D false;
> =20
>  const char *username =3D NULL;
> =20
> +static const char *session_dialect_str(uint16_t dialect);
> +
>  /* added by OH */
>  static void Ucrit_addUid(uid_t uid)
>  {
> @@ -118,12 +128,646 @@ static bool Ucrit_addPid( struct server_id pid )
>  	return True;
>  }
> =20
> +#ifdef HAVE_JANSSON
> +static int print_share_mode_json(struct file_id fid,
> +				 const struct share_mode_data *d,
> +				 const struct share_mode_entry *e,
> +				 void *private_data)
> +{
> +	struct json_object jsobj =3D *(struct json_object *)private_data;
> +	struct json_object jsobjint =3D json_new_object();
> +	static int count;
> +	static int ret =3D 0;
> +	char *denymode =3D NULL;
   	^^^^

const char *, lest GCC yells at you.

> +
> +	if (do_checks && !is_valid_share_mode_entry(e)) {
> +		return 0;
> +	}
> +
> +	count++;
> +
> +	if (do_checks && !serverid_exists(&e->pid)) {
> +		/* the process for this entry does not exist any more */
> +		return 0;
> +	}
> +	if (Ucrit_checkPid(e->pid)) {
> +		struct server_id_buf tmp;
> +		if (json_is_invalid(&jsobjint)) {
> +			return -1;
> +		}
> +		if (json_add_string(&jsobjint, "pid",
> +				    server_id_str_buf(e->pid, &tmp)) < 0) {
                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In Samba, function calls in argument lists are frowned upon:
https://git.samba.org/samba.git/?p=3Dsamba.git;a=3Dblob;f=3DREADME.Coding;h=
=3Dac9bcd43065fea7246ecddafaeac389319087628;hb=3DHEAD#l385

> +			goto failure;=09

                                     ^^

Trailing <TAB> character. This is repeated many times below.

> +		}
> +		if (resolve_uids && (json_add_string(&jsobjint, "username",
> +					    uidtoname(e->uid)) < 0)) {
                                            ^^^^^^^^^^^^^^^^^

Function call in arglist.

> +			goto failure;=09
> +		}
> +		if (json_add_int(&jsobjint, "uid", (unsigned int)e->uid) < 0) {
                                                   ^^^^^^^^^^^^^^

=2Euid here is already unsigned (uint32_t). (int) might be more
appropriate.

> +			goto failure;=09
> +		}
> +		switch (map_share_mode_to_deny_mode(e->share_access,
> +						    e->private_options)) {
> +			case DENY_NONE: denymode =3D "DENY_NONE"; break;
> +			case DENY_ALL:  denymode =3D "DENY_ALL"; break;
> +			case DENY_DOS:  denymode =3D "DENY_DOS"; break;
> +			case DENY_READ: denymode =3D "DENY_READ"; break;
> +			case DENY_WRITE:denymode =3D "DENY_WRITE"; break;
> +			case DENY_FCB:  denymode =3D "DENY_FCB"; break;
> +			default: {
> +				denymode =3D "UNKNOWN";=20
> +				break;
> +			}
> +		}
> +	        struct json_object amask =3D json_new_object();
        ^^^^^^^^

s/        /<TAB>/

> +		if (json_is_invalid(&amask)) {
> +			goto failure;=09
> +		}
> +		char *access_mask =3D NULL;
> +		access_mask =3D talloc_asprintf(NULL, "0x%08x", (unsigned int)e->acces=
s_mask);
                                                              ^^^^^^^^^^^^^^

See e->uid above.

> +		if (json_add_string(&amask, "hex", access_mask) < 0) {
> +			TALLOC_FREE(access_mask);
> +			ret =3D -1;
> +			goto failure;=09
> +		}
> +		TALLOC_FREE(access_mask);
> +		if (verbose) {
> +			if (json_add_bool(&amask, "READ_DATA",
> +				 (e->access_mask & FILE_READ_DATA)?true:false) < 0) {
> +				json_free(&amask);
> +				goto failure;=09
> +			}
> +			if (json_add_bool(&amask, "WRITE_DATA",
> +				 (e->access_mask & FILE_WRITE_DATA)?true:false) < 0) {
> +				json_free(&amask);
> +				goto failure;=09
> +			}
> +			if (json_add_bool(&amask, "APPEND_DATA",
> +				 (e->access_mask & FILE_APPEND_DATA)?true:false) < 0) {
> +				json_free(&amask);
> +				goto failure;=09
> +			}
> +			if (json_add_bool(&amask, "READ_EA",
> +				 (e->access_mask & FILE_READ_EA)?true:false) < 0) {
> +				json_free(&amask);
> +				goto failure;=09
> +			}
> +			if (json_add_bool(&amask, "WRITE_EA",
> +				 (e->access_mask & FILE_WRITE_EA)?true:false) < 0) {
> +				json_free(&amask);
> +				goto failure;=09
> +			}
> +			if (json_add_bool(&amask, "EXECUTE",
> +				 (e->access_mask & FILE_EXECUTE)?true:false) < 0) {
> +				json_free(&amask);
> +				goto failure;=09
> +			}
> +			if (json_add_bool(&amask, "READ_ATTRIBUTES",
> +				 (e->access_mask & FILE_READ_ATTRIBUTES)?true:false) < 0) {
> +				json_free(&amask);
> +				goto failure;=09
> +			}
> +			if (json_add_bool(&amask, "WRITE_ATTRIBUTES",
> +				 (e->access_mask & FILE_WRITE_ATTRIBUTES)?true:false) < 0) {
> +				json_free(&amask);
> +				goto failure;=09
> +			}
> +			if (json_add_bool(&amask, "DELETE_CHILD",
> +				 (e->access_mask & FILE_DELETE_CHILD)?true:false) < 0) {
> +				json_free(&amask);
> +				goto failure;=09
> +			}
> +			if (json_add_bool(&amask, "DELETE",
> +				 (e->access_mask & SEC_STD_DELETE)?true:false) < 0) {
> +				json_free(&amask);
> +				goto failure;=09
> +			}
> +			if (json_add_bool(&amask, "READ_CONTROL",
> +				 (e->access_mask & SEC_STD_READ_CONTROL)?true:false) < 0) {
> +				json_free(&amask);
> +				goto failure;=09
> +			}
> +			if (json_add_bool(&amask, "WRITE_DAC",
> +				 (e->access_mask & SEC_STD_WRITE_DAC)?true:false) < 0) {
> +				json_free(&amask);
> +				goto failure;=09
> +			}
> +			if (json_add_bool(&amask, "WRITE_OWNER",
> +				 (e->access_mask & SEC_STD_WRITE_OWNER)?true:false) < 0) {
> +				json_free(&amask);
> +				goto failure;=09
> +			}
> +			if (json_add_bool(&amask, "SYNCHRONIZE",
> +				 (e->access_mask & SEC_STD_SYNCHRONIZE)?true:false) < 0) {
> +				json_free(&amask);
> +				goto failure;=09
> +			}
> +		}
> +		if (json_add_object(&jsobjint, "access_mask", &amask) < 0) {
> +			json_free(&amask);
> +			goto failure;
> +		}
> +		struct json_object oplock =3D json_new_object();
> +		if (json_is_invalid(&oplock)) {
> +			goto failure;
> +		}
> +		=09
   ^^^^^^^^^^^^^^^^^^^^^

Stray tabs.

> +		if (json_add_bool(&oplock, "EXCLUSIVE",
> +				 (e->op_type & EXCLUSIVE_OPLOCK)?true:false) < 0) {
> +			json_free(&oplock);
> +			goto failure;
> +		}
> +		if (json_add_bool(&oplock, "BATCH",
> +				 (e->op_type & BATCH_OPLOCK)?true:false) < 0) {
> +			json_free(&oplock);
> +			goto failure;
> +		}
> +		if (json_add_bool(&oplock, "LEVEL_II",
> +				 (e->op_type & LEVEL_II_OPLOCK)?true:false) < 0) {
> +			json_free(&oplock);
> +			goto failure;
> +		}
> +		if (json_add_bool(&oplock, "LEASE",
> +				 (e->op_type & LEASE_OPLOCK)?true:false) < 0) {
> +			json_free(&oplock);
> +			goto failure;
> +		}
> +		if (json_add_object(&jsobjint, "oplock", &oplock) < 0) {
> +			json_free(&oplock);
> +			goto failure;
> +		}
> +		struct json_object lease =3D json_new_object();
> +		if (json_output && (e->op_type & LEASE_OPLOCK)) {
> +			struct json_object lease =3D json_new_object();

This leaks lease above! Also below check should be moved out of
the if block, same for the eventual json_add_object(lease).

> +			if (json_is_invalid(&lease)) {
> +				goto failure;
> +			}
> +			NTSTATUS status;
> +			uint32_t lstate;
> +
> +			status =3D leases_db_get(
> +				&e->client_guid,
> +				&e->lease_key,
> +				&d->id,
> +				&lstate, /* current_state */
> +				NULL, /* breaking */
> +				NULL, /* breaking_to_requested */
> +				NULL, /* breaking_to_required */
> +				NULL, /* lease_version */
> +				NULL); /* epoch */
> +
> +			if (NT_STATUS_IS_OK(status)) {
> +				if (json_add_bool(&lease, "READ",
> +						 (lstate & SMB2_LEASE_READ)?true:false) < 0) {
> +					json_free(&lease);
> +					goto failure;
> +				}
> +				if (json_add_bool(&lease, "WRITE",
> +						 (lstate & SMB2_LEASE_WRITE)?true:false) < 0) {
> +					json_free(&lease);
> +					goto failure;
> +				}
> +				if (json_add_bool(&lease, "HANDLE",
> +						 (lstate & SMB2_LEASE_HANDLE)?true:false) < 0) {
> +					json_free(&lease);
> +					goto failure;
> +				}
> +			}
> +			if (json_add_object(&jsobjint, "lease", &lease) < 0) {
> +				json_free(&lease);
> +				goto failure;
> +			}
> +		}
> +		else {
> +			if (json_add_bool(&lease, "READ", false) < 0) {
> +				json_free(&lease);
> +				goto failure;
> +			}
> +			if (json_add_bool(&lease, "WRITE", false) < 0) {
> +				json_free(&lease);
> +				goto failure;
> +			}
> +			if (json_add_bool(&lease, "HANDLE", false) < 0) {
> +				json_free(&lease);
> +				goto failure;
> +			}
> +			if (json_add_object(&jsobjint, "lease", &lease) < 0) {
> +				json_free(&lease);
> +				goto failure;
> +			}
> +		}
> +		if (json_add_string(&jsobjint, "service_path", d->servicepath) < 0) {
> +			goto failure;
> +		}
> +		char *filename =3D NULL;
> +		filename =3D talloc_asprintf(NULL, "%s%s", d->base_name,
> +			(d->stream_name !=3D NULL) ? d->stream_name : "");
> +		if (json_add_string(&jsobjint, "filename", filename) < 0) {
> +			TALLOC_FREE(filename);
> +			goto failure;
> +		}
> +		TALLOC_FREE(filename);
> +		if (json_add_object(&jsobj, NULL, &jsobjint) < 0) {
> +			goto failure;
> +		}
> +	}
> +
> +	return 0;
> +
> +failure:
> +	json_free(&jsobjint);
> +	return -1;
> +}
> +
> +static void print_brl_json(struct file_id id,
> +			struct server_id pid,=20
                                             ^

Trailing space.

> +			enum brl_type lock_type,
> +			enum brl_flavour lock_flav,
> +			br_off start,
> +			br_off size,
> +			void *private_data)
> +{
> +        struct json_object jsobj =3D *(struct json_object *)private_data;
> +        struct json_object jsobjint =3D json_new_object();
> +	static int count;
> +	unsigned int i;
> +	static const struct {
> +		enum brl_type lock_type;
> +		const char *desc;
> +	} lock_types[] =3D {
> +		{ READ_LOCK, "R" },
> +		{ WRITE_LOCK, "W" },
> +		{ UNLOCK_LOCK, "U" }
> +	};
> +	const char *desc=3D"X";
> +	const char *sharepath =3D "";
> +	char *fname =3D NULL;
> +	struct share_mode_lock *share_mode;

struct share_mode_lock *share_mode =3D NULL;

> +	struct server_id_buf tmp;
> +
> +	count++;
> +
> +	share_mode =3D fetch_share_mode_unlocked(NULL, id);
> +	if (share_mode) {
> +		bool has_stream =3D share_mode->data->stream_name !=3D NULL;
> +
> +		fname =3D talloc_asprintf(NULL, "%s%s%s",
> +					share_mode->data->base_name,
> +					has_stream ? ":" : "",
> +					has_stream ?
> +					share_mode->data->stream_name :
> +					"");
> +	} else {
> +		fname =3D talloc_strdup(NULL, "");
> +		if (fname =3D=3D NULL) {
> +			return;
> +		}
> +	}
> +
> +	for (i=3D0;i<ARRAY_SIZE(lock_types);i++) {
> +		if (lock_type =3D=3D lock_types[i].lock_type) {
> +			desc =3D lock_types[i].desc;
> +		}
> +	}
> +	if (json_is_invalid(&jsobjint)) {
> +		goto failure;=09
> +	}
> +	if (json_add_string(&jsobjint, "pid",
> +			    server_id_str_buf(pid, &tmp)) < 0) {
> +		goto failure;=09
> +	}
> +	if (json_add_string(&jsobjint, "dev_inode",
> +			    file_id_string_tos(&id)) < 0) {
> +		goto failure;=09
> +	}
> +	if (json_add_string(&jsobjint, "read_write", desc) < 0) {
> +		goto failure;=09
> +	}
> +	if (json_add_int(&jsobjint, "start", (intmax_t)start) < 0) {
                                              ^^^^^^^^^^^^^^^

This conversion is lossy. Unfortunately we don=E2=80=99t currently have
JSON helpers for 64 bits values.

There is WIP patchset that among other things adds
json_add_uint64() and similar APIs:

  https://gitlab.com/samba-team/devel/samba/tree/phgsng-net-dominfo

The functions are introduced in these two commits:

  =C3=97 https://gitlab.com/samba-team/devel/samba/commit/6ef567d15c3205a1e=
c5de74d34add4231f91d0d4
  =C3=97 https://gitlab.com/samba-team/devel/samba/commit/2b0982b2987474882=
25d8e6f99794f0acb58d0e6

which IIRC are self-contained but probably overkill for your
purposes.

> +		goto failure;=09
> +	}
> +	if (json_add_int(&jsobjint, "size", (intmax_t)size) < 0) {
                                            ^^^^^^^^^^^^^^^

See above.

> +		goto failure;=09
> +	}
> +	if (json_add_string(&jsobjint, "share_path", sharepath) < 0) {
> +		goto failure;=09
> +	}
> +	if (json_add_string(&jsobjint, "file_name", fname) < 0) {
> +		goto failure;=09
> +	}
> +	if (json_add_object(&jsobj, NULL, &jsobjint) < 0) {
> +		goto failure;
> +	}
> +
> +	TALLOC_FREE(fname);
> +	TALLOC_FREE(share_mode);
> +
> +failure:
> +	TALLOC_FREE(fname);
> +	TALLOC_FREE(share_mode);
> +	json_free(&jsobjint);
> +}
> +
> +static int traverse_connections_json(const struct connections_key *key,
> +				const struct connections_data *crec,
> +				void *private_data)
> +{
> +        struct json_object jsobj =3D *(struct json_object *)private_data;
> +        struct json_object jsobjint =3D json_new_object();
> +	struct server_id_buf tmp;
> +	char *timestr =3D NULL;
> +	int result =3D 0;
> +	const char *encryption =3D "-";
> +	const char *signing =3D "-";
> +
> +	if (crec->cnum =3D=3D TID_FIELD_INVALID)
> +		return 0;
> +
> +	if (do_checks &&
> +	    (!process_exists(crec->pid) || !Ucrit_checkUid(crec->uid))) {
> +		return 0;
> +	}
> +
> +	timestr =3D timestring(NULL, crec->start);
> +	if (timestr =3D=3D NULL) {
> +		return -1;
> +	}
> +
> +	if (smbXsrv_is_encrypted(crec->encryption_flags)) {
> +		switch (crec->cipher) {
> +		case SMB_ENCRYPTION_GSSAPI:
> +			encryption =3D "GSSAPI";
> +			break;
> +		case SMB2_ENCRYPTION_AES128_CCM:
> +			encryption =3D "AES-128-CCM";
> +			break;
> +		case SMB2_ENCRYPTION_AES128_GCM:
> +			encryption =3D "AES-128-GCM";
> +			break;
> +		default:
> +			encryption =3D "???";
> +			result =3D -1;
> +			break;
> +		}
> +	}
> +
> +	if (smbXsrv_is_signed(crec->signing_flags)) {
> +		if (crec->dialect >=3D SMB3_DIALECT_REVISION_302) {
> +			signing =3D "AES-128-CMAC";
> +		} else if (crec->dialect >=3D SMB2_DIALECT_REVISION_202) {
> +			signing =3D "HMAC-SHA256";
> +		} else {
> +			signing =3D "HMAC-MD5";
> +		}
> +	}
> +
> +	if (json_is_invalid(&jsobjint)) {
> +		TALLOC_FREE(timestr);
> +		return -1;=09
> +	}
> +	if (json_add_string(&jsobjint, "service", crec->servicename) < 0) {
> +		goto failure;
> +	}
> +	if (json_add_string(&jsobjint, "pid",
> +			    server_id_str_buf(crec->pid, &tmp)) < 0) {
> +		goto failure;
> +	}
> +	if (json_add_string(&jsobjint, "machine", crec->machine) < 0) {
> +		goto failure;
> +	}
> +	if (json_add_string(&jsobjint, "connected_at", timestr) < 0) {
> +		goto failure;
> +	}
> +	if (json_add_string(&jsobjint, "encryption", encryption) < 0) {
> +		goto failure;
> +	}
> +	if (json_add_string(&jsobjint, "signing", signing) < 0) {
> +		goto failure;
> +	}
> +	if (json_add_object(&jsobj, NULL, &jsobjint) < 0) {
> +		goto failure;
> +	}
> +
> +	TALLOC_FREE(timestr);
> +	return result;
> +
> +failure:
> +	TALLOC_FREE(timestr);
> +	json_free(&jsobjint);
> +	return -1;
> +}
> +
> +static int traverse_sessionid_json(const char *key, struct sessionid *se=
ssion,
> +				    void *private_data)
> +{
> +	struct json_object jsobj =3D *(struct json_object *)private_data;
> +	struct json_object jsobjint =3D json_new_object();
> +	struct server_id_buf tmp;
> +	int result =3D 0;
> +	const char *encryption =3D "-";
> +	const char *signing =3D "-";
> +
> +	if (do_checks &&
> +	    (!process_exists(session->pid) ||
> +	     !Ucrit_checkUid(session->uid))) {
> +		return 0;
> +	}
> +
> +	Ucrit_addPid(session->pid);
> +
> +	if (json_output && json_is_invalid(&jsobjint)) {
            ^^^^^^^^^^^

Why check json_output here? Can=E2=80=99t we just assume that when a
=E2=80=9C*_json()=E2=80=9D method is run?

> +		return -1;
> +	}
> +
> +	if (numeric_only) {
> +		if (json_output) {
> +			if (json_add_int(&jsobjint, "uid",
> +					 (unsigned int)session->uid) < 0) {
> +				goto failure;
> +			}
> +			if (json_add_int(&jsobjint, "gid",
> +					 (unsigned int)session->gid) < 0) {
> +				goto failure;
> +			}
> +		}
> +	} else {
> +		if (json_output) {
> +			if (json_add_int(&jsobjint, "uid",
> +					 (unsigned int)session->uid) < 0) {
> +				goto failure;
> +			}
> +			if (json_add_int(&jsobjint, "gid",
> +					 (unsigned int)session->gid) < 0) {
> +				goto failure;
> +			}
> +		}

The above condition could be simplified by moving the =E2=80=9Cif
(json_output)=E2=80=9D block out and then starting here with =E2=80=9Cif
(!numeric_only)=E2=80=9D.

> +		if (session->uid =3D=3D -1 && session->gid =3D=3D -1) {
> +			/*
> +			 * The session is not fully authenticated yet.
> +			 */
> +			if (json_add_string(&jsobjint, "username",
> +					    "(auth in progress)") < 0) {=20
                                                                        ^

Trailing space.

> +				goto failure;
> +			}
> +			if (json_add_string(&jsobjint, "groupname",
> +					    "(auth in progress)") < 0) {
> +				goto failure;
> +			}
> +		} else {
> +			/*
> +			 * In theory it should not happen that one of
> +			 * session->uid and session->gid is valid (ie !=3D -1)
> +			 * while the other is not (ie =3D -1), so we a check for
> +			 * that case that bails out would be reasonable.
> +			 */
> +			const char *uid_name =3D "-1";
> +			const char *gid_name =3D "-1";
> +
> +			if (session->uid !=3D -1) {
> +				uid_name =3D uidtoname(session->uid);
> +				if (uid_name =3D=3D NULL) {
> +					return -1;
> +				}
> +			}
> +			if (session->gid !=3D -1) {
> +				gid_name =3D gidtoname(session->gid);
> +				if (gid_name =3D=3D NULL) {
> +					return -1;
> +				}
> +			}
> +			if (json_output) {

The {u,g}id_name values are unused unless json_output is set so
you might as well =E2=80=9Celse if (json_output)=E2=80=9D above.

> +				if (json_add_string(&jsobjint, "username",
> +						    uid_name) < 0) {
> +					goto failure;
> +				}
> +				if (json_add_string(&jsobjint, "groupname",
> +					 	    gid_name) < 0) {
> +					goto failure;
> +				}
> +			}
> +		}
> +	}
> +
> +	if (smbXsrv_is_encrypted(session->encryption_flags)) {
> +		switch (session->cipher) {
> +		case SMB2_ENCRYPTION_AES128_CCM:
> +			encryption =3D "AES-128-CCM";
> +			break;
> +		case SMB2_ENCRYPTION_AES128_GCM:
> +			encryption =3D "AES-128-GCM";
> +			break;
> +		default:
> +			encryption =3D "???";
                                     ^^^^^

Maybe something like =E2=80=9Cunknown (%hu)=E2=80=9D with the cipher number=
 instead?

> +			result =3D -1;
> +			break;
> +		}
> +	} else if (smbXsrv_is_partially_encrypted(session->encryption_flags)) {
> +		switch (session->cipher) {
> +		case SMB_ENCRYPTION_GSSAPI:
> +			encryption =3D "partial(GSSAPI)";
> +			break;
> +		case SMB2_ENCRYPTION_AES128_CCM:
> +			encryption =3D "partial(AES-128-CCM)";
> +			break;
> +		case SMB2_ENCRYPTION_AES128_GCM:
> +			encryption =3D "partial(AES-128-GCM)";
> +			break;
> +		default:
> +			encryption =3D "???";

See above.

> +			result =3D -1;
> +			break;
> +		}
> +	}
> +
> +	if (smbXsrv_is_signed(session->signing_flags)) {
> +		if (session->connection_dialect >=3D SMB3_DIALECT_REVISION_302) {
> +			signing =3D "AES-128-CMAC";
> +		} else if (session->connection_dialect >=3D SMB2_DIALECT_REVISION_202)=
 {
> +			signing =3D "HMAC-SHA256";
> +		} else {
> +			signing =3D "HMAC-MD5";
> +		}
> +	} else if (smbXsrv_is_partially_signed(session->signing_flags)) {
> +		if (session->connection_dialect >=3D SMB3_DIALECT_REVISION_302) {
> +			signing =3D "partial(AES-128-CMAC)";
> +		} else if (session->connection_dialect >=3D SMB2_DIALECT_REVISION_202)=
 {
> +			signing =3D "partial(HMAC-SHA256)";
> +		} else {
> +			signing =3D "partial(HMAC-MD5)";
> +		}
> +	}
> +
> +
> +	if (json_output) {
> +		if (json_add_string(&jsobjint, "remote_machine",
> +				    session->remote_machine) < 0) {
> +			goto failure;
> +		}
> +		if (json_add_string(&jsobjint, "hostname", session->hostname) < 0) {
> +			goto failure;
> +		}
> +		if (json_add_string(&jsobjint, "session_dialect",
> +				    session_dialect_str(session->connection_dialect)) < 0) {
> +			goto failure;
> +		}
> +		if (json_add_string(&jsobjint, "encryption", encryption) < 0) {
> +			goto failure;
> +		}
> +		if (json_add_string(&jsobjint, "signing", signing) < 0) {
> +			goto failure;
> +		}
> +		if (json_add_object(&jsobj, server_id_str_buf(session->pid, &tmp), &js=
objint) < 0) {
> +			goto failure;
> +		}
> +	}
> +
> +	return result;
> +
> +failure:
> +	json_free(&jsobjint);
> +	return -1;
> +}
> +
> +static bool print_notify_rec_json(const char *path, struct server_id ser=
ver,
> +			     const struct notify_instance *instance,
> +			     void *private_data)
> +{
> +	struct server_id_buf idbuf;
> +	struct json_object jsobj =3D *(struct json_object *)private_data;
> +	struct json_object jsobjint =3D json_new_object();
> +
> +	if (json_is_invalid(&jsobjint)) {
> +		return false;
> +	}
> +	if (json_add_string(&jsobjint, "pid", server_id_str_buf(server, &idbuf)=
) < 0) {
                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^

Function call in arglist.

> +		goto failure;
> +	}
> +	if (json_add_string(&jsobjint, "path", path) < 0) {
> +		goto failure;
> +	}
> +	if (json_add_int(&jsobjint, "filter", (unsigned)instance->filter) < 0) {
                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^

Already unsigned, I=E2=80=99d prefer (int).

> +		goto failure;
> +	}
> +	if (json_add_int(&jsobjint, "subdir_filter", (unsigned)instance->subdir=
_filter) < 0) {
                                                     ^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^

See above.

> +		goto failure;
> +	}
> +	if (json_add_object(&jsobj, NULL, &jsobjint) < 0) {
> +		goto failure;
> +	}
> +
> +	return true;
> +
> +failure:
> +	json_free(&jsobjint);
> +	return false;
> +}
> +#endif /* [HAVE_JANSSON] */
> +
>  static int print_share_mode(struct file_id fid,
>  			    const struct share_mode_data *d,
>  			    const struct share_mode_entry *e,
>  			    void *private_data)
>  {
> -	bool resolve_uids =3D *((bool *)private_data);
>  	static int count;
> =20
>  	if (do_checks && !is_valid_share_mode_entry(e)) {
> @@ -144,6 +788,7 @@ static int print_share_mode(struct file_id fid,
> =20
>  	if (Ucrit_checkPid(e->pid)) {
>  		struct server_id_buf tmp;
> +		char *denymode =3D NULL;

This hunk should be dropped, denymode is only used in the JSON
version.

>  		d_printf("%-11s  ", server_id_str_buf(e->pid, &tmp));
>  		if (resolve_uids) {
>  			d_printf("%-14s  ", uidtoname(e->uid));
> @@ -156,7 +801,7 @@ static int print_share_mode(struct file_id fid,
>  			case DENY_ALL:  d_printf("DENY_ALL   "); break;
>  			case DENY_DOS:  d_printf("DENY_DOS   "); break;
>  			case DENY_READ: d_printf("DENY_READ  "); break;
> -			case DENY_WRITE:printf("DENY_WRITE "); break;
> +			case DENY_WRITE:d_printf("DENY_WRITE "); break;
>  			case DENY_FCB:  d_printf("DENY_FCB "); break;
>  			default: {
>  				d_printf("unknown-please report ! "
> @@ -508,7 +1153,6 @@ static int traverse_sessionid(const char *key, struc=
t sessionid *session,
>  	return result;
>  }
> =20
> -
>  static bool print_notify_rec(const char *path, struct server_id server,
>  			     const struct notify_instance *instance,
>  			     void *private_data)
> @@ -530,10 +1174,13 @@ int main(int argc, const char *argv[])
>  {
>  	int c;
>  	int profile_only =3D 0;
> +	#ifdef HAVE_JANSSON
> +	char *json_str =3D NULL;

Unused variable.

> +	struct json_object jsobj =3D json_new_object();
> +	#endif /* [HAVE_JANSSON] */
>  	bool show_processes, show_locks, show_shares;
>  	bool show_notify =3D false;
> -	bool resolve_uids =3D false;
> -	poptContext pc =3D NULL;
> +	poptContext pc;

What is the motivation for this change?

Cf. https://git.samba.org/samba.git/?p=3Dsamba.git;a=3Dblob;f=3DREADME.Codi=
ng;h=3Dac9bcd43065fea7246ecddafaeac389319087628;hb=3DHEAD#l352

>  	struct poptOption long_options[] =3D {
>  		POPT_AUTOHELP
>  		{
> @@ -625,6 +1272,14 @@ int main(int argc, const char *argv[])
>  			.descrip    =3D "Numeric uid/gid"
>  		},
>  		{
> +			.longName   =3D "json",
> +			.shortName  =3D 'j',
> +			.argInfo    =3D POPT_ARG_NONE,
> +			.arg        =3D NULL,
> +			.val        =3D 'j',
> +			.descrip    =3D "JSON output"
> +		},
> +		{
>  			.longName   =3D "fast",
>  			.shortName  =3D 'f',
>  			.argInfo    =3D POPT_ARG_NONE,
> @@ -704,6 +1359,9 @@ int main(int argc, const char *argv[])
>  		case 'n':
>  			numeric_only =3D true;
>  			break;
> +		case 'j':

=46rom a user=E2=80=99s perspective, I would suggest to error out here if
!HAVE_JANSSON.

> +			json_output =3D true;
> +			break;
>  		case 'f':
>  			do_checks =3D false;
>  			break;
> @@ -722,7 +1380,7 @@ int main(int argc, const char *argv[])
>  	if ( username )
>  		Ucrit_addUid( nametouid(username) );
> =20
> -	if (verbose) {
> +	if (verbose && !json_output) {
>  		d_printf("using configfile =3D %s\n", get_dyn_CONFIGFILE());
>  	}
> =20
> @@ -756,11 +1414,30 @@ int main(int argc, const char *argv[])
>  	}
> =20
>  	if ( show_processes ) {
> -		d_printf("\nSamba version %s\n",samba_version_string());
> -		d_printf("%-7s %-12s %-12s %-41s %-17s %-20s %-21s\n", "PID", "Usernam=
e", "Group", "Machine", "Protocol Version", "Encryption", "Signing");
> -		d_printf("------------------------------------------------------------=
---------------------------------------------------------------------------=
-\n");
> +		if (!json_output) {
> +			d_printf("\nSamba version %s\n",samba_version_string());
> +			d_printf("%-7s %-12s %-12s %-41s %-17s %-20s %-21s\n", "PID", "Userna=
me", "Group", "Machine", "Protocol Version", "Encryption", "Signing");
> +			d_printf("-----------------------------------------------------------=
---------------------------------------------------------------------------=
--\n");
> +			sessionid_traverse_read(traverse_sessionid, frame);
> +		}
> +		#ifdef HAVE_JANSSON
> +		else {
> +			struct json_object sessions =3D json_new_object();
> +			if (json_is_invalid(&sessions)) {
> +				d_printf("Failed to create JSON object [sessions]\n");
> +				ret =3D -1;
> +				goto done;
> +			}
> =20
> -		sessionid_traverse_read(traverse_sessionid, frame);
> +			sessionid_traverse_read(traverse_sessionid_json, &sessions);
> +			if (json_add_object(&jsobj, "sessions", &sessions) < 0) {
> +				d_printf("Failed to add JSON object [sessions]\n");
> +				json_free(&sessions);
> +				ret =3D -1;
> +				goto done;
> +			}
> +		}
> +		#endif /* [HAVE_JANSSON] */
> =20
>  		if (processes_only) {
>  			goto done;
> @@ -771,13 +1448,33 @@ int main(int argc, const char *argv[])
>  		if (brief) {
>  			goto done;
>  		}
> +=20
> +		if (!json_output) {
> +			d_printf("\n%-12s %-7s %-13s %-32s %-12s %-12s\n", "Service", "pid", =
"Machine", "Connected at", "Encryption", "Signing");
> +			d_printf("-----------------------------------------------------------=
----------------------------------\n");
> +			connections_forall_read(traverse_connections, frame);
> +		}
> +		#ifdef HAVE_JANSSON
> +		else {
> +			struct json_object shares_array =3D json_new_array();
> +			if (json_is_invalid(&shares_array)) {
> +				d_printf("Failed to create JSON array [shares_array]\n");
> +				ret =3D 1;
> +				goto done;
> +			}
> +			connections_forall_read(traverse_connections_json, &shares_array);
> +			if (json_add_object(&jsobj, "shares", &shares_array) < 0) {
> +				d_printf("Failed to add JSON array [shares_array]\n");
> +				json_free(&shares_array);
> +				ret =3D -1;
> +				goto done;
> +			}
> =20
> -		d_printf("\n%-12s %-7s %-13s %-32s %-12s %-12s\n", "Service", "pid", "=
Machine", "Connected at", "Encryption", "Signing");
> -		d_printf("------------------------------------------------------------=
---------------------------------\n");
> -
> -		connections_forall_read(traverse_connections, frame);
> -
> -		d_printf("\n");
> +			if (!json_output) {
> +				d_printf("\n");
> +			}
> +		}
> +		#endif /* [HAVE_JANSSON] */
> =20
>  		if ( shares_only ) {
>  			goto done;
> @@ -815,8 +1512,27 @@ int main(int argc, const char *argv[])
>  			ret =3D 1;
>  			goto done;
>  		}
> -
> -		result =3D share_entry_forall(print_share_mode, &resolve_uids);
> +		if (!json_output) {
> +			result =3D share_entry_forall(print_share_mode, NULL);
> +		}
> +		#if HAVE_JANSSON
> +		else {
> +			struct json_object locks_array =3D json_new_array();
> +			if (json_is_invalid(&locks_array)) {
> +				locking_end();
> +				d_printf("Failed to create JSON array [locks_array]\n");
> +				ret =3D 1;
> +				goto done;
> +			}
> +			result =3D share_entry_forall(print_share_mode_json, &locks_array);
> +			if (json_add_object(&jsobj, "locked_files", &locks_array) < 0) {
> +				locking_end();
> +				d_printf("Failed to add JSON array [locks_array]\n");
> +				ret =3D 1;
> +				goto done;
> +			}
> +		}
> +		#endif /* [HAVE_JANSSON] */
> =20
>  		if (result =3D=3D 0) {
>  			d_printf("No locked files\n");
> @@ -824,11 +1540,31 @@ int main(int argc, const char *argv[])
>  			d_printf("locked file list truncated\n");
>  		}
> =20
> -		d_printf("\n");
> +		if (!json_output) {
> +			d_printf("\n");
> +		}
> =20
> -		if (show_brl) {
> +		if (show_brl && !json_output) {
>  			brl_forall(print_brl, NULL);
>  		}
> +		#if HAVE_JANSSON
> +		else if (show_brl) {
> +			struct json_object brl_array =3D json_new_array();
> +			if (json_is_invalid(&brl_array)) {
> +				locking_end();
> +				d_printf("Failed to create JSON array [brl_array]\n");
> +				ret =3D 1;
> +				goto done;
> +			}
> +			brl_forall(print_brl_json, &brl_array);
> +			if (json_add_object(&jsobj, "brl", &brl_array) < 0) {
> +				locking_end();
> +				d_printf("Failed to add JSON array [brl_array]\n");
> +				ret =3D 1;
> +				goto done;
> +			}
> +		}
> +		#endif /* [HAVE_JANSSON] */
> =20
>  		locking_end();
>  	}
> @@ -841,12 +1577,37 @@ int main(int argc, const char *argv[])
>  		if (n =3D=3D NULL) {
>  			goto done;
>  		}
> -		notify_walk(n, print_notify_rec, NULL);
> +		if (!json_output) {
> +			notify_walk(n, print_notify_rec, NULL);
> +		}
> +		#if HAVE_JANSSON
> +		else {
> +			struct json_object notify_array =3D json_new_array();
> +			if (json_is_invalid(&notify_array)) {
> +				locking_end();
> +				d_printf("Failed to create JSON array [notify_array]\n");
> +				ret =3D 1;
> +				goto done;
> +			}
> +			notify_walk(n, print_notify_rec_json, &notify_array);
> +			if (json_add_object(&jsobj, "notify", &notify_array) < 0) {
> +				locking_end();
> +				d_printf("Failed to add JSON array [notify_array]\n");
> +				ret =3D 1;
> +				goto done;
> +			}
> +		}
> +		#endif /* [HAVE_JANSSON] */
>  		TALLOC_FREE(n);
>  	}
> =20
>  done:
> -	poptFreeContext(pc);

This introduces a memleak.

> +	#ifdef HAVE_JANSSON
> +	if (json_output) {
> +		d_printf("%s\n", json_to_string(frame, &jsobj));

Currently smbstatus will write helpful messages to stdout that
aren=E2=80=99t JSON:

    # ./bin/smbstatus --json 2>/dev/null
    /home/me/tmp/sambadst/var/lib/samba/lock/locking.tdb not initialised
    This is normal if an SMB client has never connected to your server.
    # echo $?
    0

This is unfortunate for a consumer of the output since there is
no straightforward way of telling that it should not expect a
parseable result. IMO it would be be desirable to either move
these messages to stderr or to exit non-zero.

Even worse:

    # ./bin/smbstatus  --json  -L 2>/dev/null
    No locked files
    {"locked_files": []}

Here JSON and non-JSON are mixed on stdout.

> +	}
> +	json_free(&jsobj);
> +	#endif HAVE_JANSSON

#endif /* HAVE_JANSSON */

>  	TALLOC_FREE(frame);
>  	return ret;
>  }

Best regards,
Philipp

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEc8fuSIDXOZ07wD2Q8S2brBeKCUwFAl1w5zcACgkQ8S2brBeK
CUxyvRAAli/AfrO7bV9ZEw2rXX6xqIWQc2dMa4D7Gh3fFdaSgT0RoRzF3wvL90CD
DhPN9p9ZjTbZAtX4OLKbUG6SfTQ7s/4cTpqk5ooOp0d0qD9uYn8fjtuQmun3kPDx
85FcGzQKZVf2bsp9XUSe9cUOX1JBcY2d+cD+BFNlv1yjk/RPo9t3sHGgx/uvpC3L
48Ocn2JIksJ9dI5/lKVu8A+14SQVTVI+BoyE8FuteqDFJhitMOFtoIdV3o2oyD1/
hVYacvZDLmpcOQeRCrVpgtYnDE2MJVL4uETYuWlmc8fB+TAM9I2kw5AfE+AqXqZd
ySmyyocA2U7kbHcMnFwAqSFGRvDuVr3/IQ9bC8lYWvI1FnSh21+7nzBxE5Gkxru4
LJ0E4rR2FCNwLLcIQ/tqC498NYaWwaZH7XF9Wp1llA4n8Nnl68W93oWarxFlrdDY
IQPYZAoBFZMmQH2ggVNvCim2KmfB/xsrkBIPAevfpmqtI5c7QabsLyzB4M8JdMUG
DkfvkHnbVhCKa4E4+8PPpo8ISO6oHypUThmvvCaL/XR6fR/tadAyQTM9QUyyzCLf
TYGWvNO9Fahn6SCrQp6ffsglWJRzL4sgxnN5d9+P/kSIrFoo9KZyzqnfmcSHpFtk
KCmdh15P3Ci2E0tlE/r5sOoO95EinljbDCaB4bkoMWoGoQk+ZqY=
=O43+
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--

