Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB8E9A415
	for <lists+samba-technical@lfdr.de>; Fri, 23 Aug 2019 01:52:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=nVNWarglm+P6WLHA4/m+ARJtqjbxuQP193wMk+TsC7I=; b=GBs5ZgCblTeg4Q1Pm7DsEw6Ec9
	dk3Cfx08qtSmF7t2ABFbHuBn7Au7NQO6qYeSecksPlma8f2LQkFdy00mcaoVar6TLEskE+61ConSn
	bxH33W49IpBgOIvcWM+G4aHC5jE1ucvGAtC2cWD5IZqaTN37Nh94gvrXHvqe/IN8P+q0niuAuO5n0
	Sphz6dSRaHHJDBnHIRU8aSnnpdupCrOJZCJ6p9XXKBvVToEaHzb2hbovRc6cM3gpD1YFPUl4kY8mu
	iBL0KsDqjk79EBpG7DyO8gJSaOSLisCu8kuKj51ZeJFshnWGFPOBNETnh6LRK90ryiEmAkZq5TDqF
	C9RY7CDg==;
Received: from localhost ([::1]:33880 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i0wsE-007fdB-LB; Thu, 22 Aug 2019 23:52:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39200) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i0ws7-007fd3-SJ
 for samba-technical@lists.samba.org; Thu, 22 Aug 2019 23:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=nVNWarglm+P6WLHA4/m+ARJtqjbxuQP193wMk+TsC7I=; b=IBBlL5JAAU/oT22N8CI/CLDjEJ
 QQ7KAqw0VQgeylfUpFzbGASmVsG+Ex4MY8hOsGdbcq4KjediHp+BFd2jQT2zNBHfJWr+wj718MrXu
 kvAdE26bYBol0qkOq4Av7LHKW5Xu4e20euF1L3n1I0S8o+rsvneSrA/XKXBrY3U/PIXk=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i0ws5-0005Hq-I9; Thu, 22 Aug 2019 23:52:02 +0000
Date: Thu, 22 Aug 2019 16:51:58 -0700
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: [PATCH] Use pthreadpool for aio scheduling in vfs_glusterfs
Message-ID: <20190822235158.GB253700@jra4>
References: <dbaed65e1d71d7cf5da358359f2f071204a2a8a0.camel@cryptolab.net>
 <5120a5d92b02176052c2fd7cd021c2014a87758e.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5120a5d92b02176052c2fd7cd021c2014a87758e.camel@cryptolab.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: "Volker.Lendecke" <Volker.Lendecke@SerNet.DE>,
 samba-technical <samba-technical@lists.samba.org>,
 Stefan Metzmacher <metze@samba.org>, gd <gd@samba.org>, jra@samba.org,
 obnox <obnox@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Aug 22, 2019 at 03:46:55PM +0530, Anoop C S wrote:
> On Thu, 2019-08-22 at 15:43 +0530, Anoop C S via samba-technical wrote:
> > Hi,
> > 
> > Proposing the attached patch to use pthreadpool inside vfs_glusterfs
> > to
> > schedule aio operations which is found to achieve significant
> > performance boost.
> 
> Attaching a new version with BUG id updated in commit message.
> 
> > Reviews are appreciated.


I really like this, and I can see it's modelled after
Volker's pthread async code in source3/modules/vfs_default.c.

Having said that I compared the two, and there are just
a couple of changes I'd like to see.

1). Can you add leading definitions of:

	static void vfs_gluster_pread_do(void *private_data);
	static void vfs_gluster_pread_done(struct tevent_req *subreq);
	static int vfs_gluster_pread_state_destructor(struct vfswrap_pread_state *state);

and:

	static void vfs_gluster_pwrite_do(void *private_data);
	static void vfs_gluster_pwrite_done(struct tevent_req *subreq);
	static int vfs_gluster_pwrite_state_destructor(struct vfswrap_pwrite_state *state);

and:

	static void vfs_fsync_do(void *private_data);
	static void vfs_fsync_done(struct tevent_req *subreq);
	static int vfs_fsync_state_destructor(struct vfswrap_fsync_state *state);

and then change the functions code order to be:

XXX_send()
XXX_do()
XXX_destructor()
XXX_done()
XXX_recv()

to match the coding convention for async functions. When
reading the code it's nice to read downwards through:

send() -> do() (pthread internal fn). -> destructor() above -> done() -> recv()

as it makes the logic paths of the async code clearer when
reading through linearly (to me at least).

2). In the source3/modules/vfs_default.c code in pread_done(), pwrite_done()
and fsync_done() we have the blocks:

	ret = pthreadpool_tevent_job_recv(subreq);
	TALLOC_FREE(subreq);
	SMBPROFILE_BYTES_ASYNC_END(state->profile_bytes);
	talloc_set_destructor(state, NULL);
	if (ret != 0) {
                if (ret != EAGAIN) {
                        tevent_req_error(req, ret);
                        return;
                }
                /*
                 * If we get EAGAIN from pthreadpool_tevent_job_recv() this
                 * means the lower level pthreadpool failed to create a new
                 * thread. Fallback to sync processing in that case to allow
                 * some progress for the client.
                 */
		vfs_[pread/pwrite/fsync]_do()

and right now you're missing that - looking at the
pthreadpool library code I think you might need to
add that logic to ensure you fallback to sync
if pthread_create() fails with EAGAIN (which it
can do according to the man page).

If you can do that and resubmit I'd be happy to re-review
and push !

Great work !

What percentage improvements did you see with these
changes ?

Jeremy.

> From 27fd7e8e7fde4b7e478ddc3b247e93cc40c7fd53 Mon Sep 17 00:00:00 2001
> From: Poornima G <pgurusid@redhat.com>
> Date: Wed, 24 Jul 2019 15:15:33 +0530
> Subject: [PATCH] vfs_glusterfs: Use pthreadpool for scheduling aio operations
> 
> BUG: https://bugzilla.samba.org/show_bug.cgi?id=14098
> 
> Signed-off-by: Poornima G <pgurusid@redhat.com>
> Reviewed-by: Guenther Deschner <gd@samba.org>
> ---
>  source3/modules/vfs_glusterfs.c | 535 ++++++++++++++++----------------
>  1 file changed, 260 insertions(+), 275 deletions(-)
> 
> diff --git a/source3/modules/vfs_glusterfs.c b/source3/modules/vfs_glusterfs.c
> index 09299bc70c5..7f63b5d6662 100644
> --- a/source3/modules/vfs_glusterfs.c
> +++ b/source3/modules/vfs_glusterfs.c
> @@ -45,14 +45,11 @@
>  #include "lib/util/sys_rw.h"
>  #include "smbprofile.h"
>  #include "modules/posixacl_xattr.h"
> +#include "lib/pthreadpool/pthreadpool_tevent.h"
>  
>  #define DEFAULT_VOLFILE_SERVER "localhost"
>  #define GLUSTER_NAME_MAX 255
>  
> -static int read_fd = -1;
> -static int write_fd = -1;
> -static struct tevent_fd *aio_read_event = NULL;
> -
>  /**
>   * Helper to convert struct stat to struct stat_ex.
>   */
> @@ -713,245 +710,211 @@ static ssize_t vfs_gluster_pread(struct vfs_handle_struct *handle,
>  	return ret;
>  }
>  
> -struct glusterfs_aio_state;
> -
> -struct glusterfs_aio_wrapper {
> -	struct glusterfs_aio_state *state;
> -};
> -
> -struct glusterfs_aio_state {
> +struct vfs_gluster_pread_state {
>  	ssize_t ret;
> -	struct tevent_req *req;
> -	bool cancelled;
> +	glfs_fd_t *fd;
> +	void *buf;
> +	size_t count;
> +	off_t offset;
> +
>  	struct vfs_aio_state vfs_aio_state;
> -	struct timespec start;
>  	SMBPROFILE_BYTES_ASYNC_STATE(profile_bytes);
>  };
>  
> -static int aio_wrapper_destructor(struct glusterfs_aio_wrapper *wrap)
> +static void vfs_gluster_pread_do(void *private_data)
>  {
> -	if (wrap->state != NULL) {
> -		wrap->state->cancelled = true;
> -	}
> +	struct vfs_gluster_pread_state *state = talloc_get_type_abort(
> +		private_data, struct vfs_gluster_pread_state);
> +	struct timespec start_time;
> +	struct timespec end_time;
>  
> -	return 0;
> -}
> +	SMBPROFILE_BYTES_ASYNC_SET_BUSY(state->profile_bytes);
>  
> -/*
> - * This function is the callback that will be called on glusterfs
> - * threads once the async IO submitted is complete. To notify
> - * Samba of the completion we use a pipe based queue.
> - */
> +	PROFILE_TIMESTAMP(&start_time);
> +
> +	do {
>  #ifdef HAVE_GFAPI_VER_7_6
> -static void aio_glusterfs_done(glfs_fd_t *fd, ssize_t ret,
> -			       struct glfs_stat *prestat,
> -			       struct glfs_stat *poststat,
> -			       void *data)
> +		state->ret = glfs_pread(state->fd, state->buf, state->count,
> +					state->offset, 0, NULL);
>  #else
> -static void aio_glusterfs_done(glfs_fd_t *fd, ssize_t ret, void *data)
> +		state->ret = glfs_pread(state->fd, state->buf, state->count,
> +					state->offset, 0);
>  #endif
> -{
> -	struct glusterfs_aio_state *state = NULL;
> -	int sts = 0;
> -	struct timespec end;
> -
> -	state = (struct glusterfs_aio_state *)data;
> +	} while ((state->ret == -1) && (errno == EINTR));
>  
> -	PROFILE_TIMESTAMP(&end);
> -
> -	if (ret < 0) {
> -		state->ret = -1;
> +	if (state->ret == -1) {
>  		state->vfs_aio_state.error = errno;
> -	} else {
> -		state->ret = ret;
>  	}
> -	state->vfs_aio_state.duration = nsec_time_diff(&end, &state->start);
>  
> -	SMBPROFILE_BYTES_ASYNC_END(state->profile_bytes);
> +	PROFILE_TIMESTAMP(&end_time);
>  
> -	/*
> -	 * Write the state pointer to glusterfs_aio_state to the
> -	 * pipe, so we can call tevent_req_done() from the main thread,
> -	 * because tevent_req_done() is not designed to be executed in
> -	 * the multithread environment, so tevent_req_done() must be
> -	 * executed from the smbd main thread.
> -	 *
> -	 * write(2) on pipes with sizes under _POSIX_PIPE_BUF
> -	 * in size is atomic, without this, the use op pipes in this
> -	 * code would not work.
> -	 *
> -	 * sys_write is a thin enough wrapper around write(2)
> -	 * that we can trust it here.
> -	 */
> +	state->vfs_aio_state.duration = nsec_time_diff(&end_time, &start_time);
>  
> -	sts = sys_write(write_fd, &state, sizeof(struct glusterfs_aio_state *));
> -	if (sts < 0) {
> -		DEBUG(0,("\nWrite to pipe failed (%s)", strerror(errno)));
> -	}
> -
> -	return;
> +	SMBPROFILE_BYTES_ASYNC_SET_IDLE(state->profile_bytes);
>  }
>  
> -/*
> - * Read each req off the pipe and process it.
> - */
> -static void aio_tevent_fd_done(struct tevent_context *event_ctx,
> -				struct tevent_fd *fde,
> -				uint16_t flags, void *data)
> +static int vfs_gluster_pread_state_destructor(struct vfs_gluster_pread_state *state)
>  {
> -	struct tevent_req *req = NULL;
> -	struct glusterfs_aio_state *state = NULL;
> -	int sts = 0;
> -
> -	/*
> -	 * read(2) on pipes is atomic if the needed data is available
> -	 * in the pipe, per SUS and POSIX.  Because we always write
> -	 * to the pipe in sizeof(struct tevent_req *) chunks, we can
> -	 * always read in those chunks, atomically.
> -	 *
> -	 * sys_read is a thin enough wrapper around read(2) that we
> -	 * can trust it here.
> -	 */
> -
> -	sts = sys_read(read_fd, &state, sizeof(struct glusterfs_aio_state *));
> +	return -1;
> +}
>  
> -	if (sts < 0) {
> -		DEBUG(0,("\nRead from pipe failed (%s)", strerror(errno)));
> -	}
> +static void vfs_gluster_pread_done(struct tevent_req *subreq)
> +{
> +	struct tevent_req *req = tevent_req_callback_data(
> +		subreq, struct tevent_req);
> +	struct vfs_gluster_pread_state *state = tevent_req_data(
> +		req, struct vfs_gluster_pread_state);
> +	int ret;
>  
> -	/* if we've cancelled the op, there is no req, so just clean up. */
> -	if (state->cancelled == true) {
> -		TALLOC_FREE(state);
> +	ret = pthreadpool_tevent_job_recv(subreq);
> +	TALLOC_FREE(subreq);
> +	SMBPROFILE_BYTES_ASYNC_END(state->profile_bytes);
> +	talloc_set_destructor(state, NULL);
> +	if (tevent_req_error(req, ret)) {
>  		return;
>  	}
>  
> -	req = state->req;
> +	tevent_req_done(req);
> +}
> +
> +static ssize_t vfs_gluster_pread_recv(struct tevent_req *req,
> +				      struct vfs_aio_state *vfs_aio_state)
> +{
> +	struct vfs_gluster_pread_state *state = tevent_req_data(
> +		req, struct vfs_gluster_pread_state);
>  
> -	if (req) {
> -		tevent_req_done(req);
> +	if (tevent_req_is_unix_error(req, &vfs_aio_state->error)) {
> +		return -1;
>  	}
> -	return;
> +
> +	*vfs_aio_state = state->vfs_aio_state;
> +	return state->ret;
>  }
>  
> -static bool init_gluster_aio(struct vfs_handle_struct *handle)
> +static struct tevent_req *vfs_gluster_pread_send(struct vfs_handle_struct
> +						  *handle, TALLOC_CTX *mem_ctx,
> +						  struct tevent_context *ev,
> +						  files_struct *fsp,
> +						  void *data, size_t n,
> +						  off_t offset)
>  {
> -	int fds[2];
> -	int ret = -1;
> +	struct vfs_gluster_pread_state *state;
> +	struct tevent_req *req, *subreq;
>  
> -	if (read_fd != -1) {
> -		/*
> -		 * Already initialized.
> -		 */
> -		return true;
> +	glfs_fd_t *glfd = vfs_gluster_fetch_glfd(handle, fsp);
> +	if (glfd == NULL) {
> +		DBG_ERR("Failed to fetch gluster fd\n");
> +		return NULL;
>  	}
>  
> -	ret = pipe(fds);
> -	if (ret == -1) {
> -		goto fail;
> +	req = tevent_req_create(mem_ctx, &state, struct vfs_gluster_pread_state);
> +	if (req == NULL) {
> +		return NULL;
>  	}
>  
> -	read_fd = fds[0];
> -	write_fd = fds[1];
> +	state->ret = -1;
> +	state->fd = glfd;
> +	state->buf = data;
> +	state->count = n;
> +	state->offset = offset;
>  
> -	aio_read_event = tevent_add_fd(handle->conn->sconn->ev_ctx,
> -					NULL,
> -					read_fd,
> -					TEVENT_FD_READ,
> -					aio_tevent_fd_done,
> -					NULL);
> -	if (aio_read_event == NULL) {
> -		goto fail;
> -	}
> +	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pread, profile_p,
> +				     state->profile_bytes, n);
> +	SMBPROFILE_BYTES_ASYNC_SET_IDLE(state->profile_bytes);
>  
> -	return true;
> -fail:
> -	TALLOC_FREE(aio_read_event);
> -	if (read_fd != -1) {
> -		close(read_fd);
> -		close(write_fd);
> -		read_fd = -1;
> -		write_fd = -1;
> +	subreq = pthreadpool_tevent_job_send(
> +		state, ev, handle->conn->sconn->pool,
> +		vfs_gluster_pread_do, state);
> +	if (tevent_req_nomem(subreq, req)) {
> +		return tevent_req_post(req, ev);
>  	}
> -	return false;
> +	tevent_req_set_callback(subreq, vfs_gluster_pread_done, req);
> +
> +	talloc_set_destructor(state, vfs_gluster_pread_state_destructor);
> +
> +	return req;
>  }
>  
> -static struct glusterfs_aio_state *aio_state_create(TALLOC_CTX *mem_ctx)
> +struct vfs_gluster_pwrite_state {
> +	ssize_t ret;
> +	glfs_fd_t *fd;
> +	const void *buf;
> +	size_t count;
> +	off_t offset;
> +
> +	struct vfs_aio_state vfs_aio_state;
> +	SMBPROFILE_BYTES_ASYNC_STATE(profile_bytes);
> +};
> +
> +static void vfs_gluster_pwrite_do(void *private_data)
>  {
> -	struct tevent_req *req = NULL;
> -	struct glusterfs_aio_state *state = NULL;
> -	struct glusterfs_aio_wrapper *wrapper = NULL;
> +	struct vfs_gluster_pwrite_state *state = talloc_get_type_abort(
> +		private_data, struct vfs_gluster_pwrite_state);
> +	struct timespec start_time;
> +	struct timespec end_time;
>  
> -	req = tevent_req_create(mem_ctx, &wrapper, struct glusterfs_aio_wrapper);
> +	SMBPROFILE_BYTES_ASYNC_SET_BUSY(state->profile_bytes);
>  
> -	if (req == NULL) {
> -		return NULL;
> -	}
> +	PROFILE_TIMESTAMP(&start_time);
>  
> -	state = talloc_zero(NULL, struct glusterfs_aio_state);
> +	do {
> +#ifdef HAVE_GFAPI_VER_7_6
> +		state->ret = glfs_pwrite(state->fd, state->buf, state->count,
> +					 state->offset, 0, NULL, NULL);
> +#else
> +		state->ret = glfs_pwrite(state->fd, state->buf, state->count,
> +					 state->offset, 0);
> +#endif
> +	} while ((state->ret == -1) && (errno == EINTR));
>  
> -	if (state == NULL) {
> -		TALLOC_FREE(req);
> -		return NULL;
> +	if (state->ret == -1) {
> +		state->vfs_aio_state.error = errno;
>  	}
>  
> -	talloc_set_destructor(wrapper, aio_wrapper_destructor);
> -	state->cancelled = false;
> -	state->req = req;
> +	PROFILE_TIMESTAMP(&end_time);
>  
> -	wrapper->state = state;
> +	state->vfs_aio_state.duration = nsec_time_diff(&end_time, &start_time);
>  
> -	return state;
> +	SMBPROFILE_BYTES_ASYNC_SET_IDLE(state->profile_bytes);
>  }
>  
> -static struct tevent_req *vfs_gluster_pread_send(struct vfs_handle_struct
> -						  *handle, TALLOC_CTX *mem_ctx,
> -						  struct tevent_context *ev,
> -						  files_struct *fsp,
> -						  void *data, size_t n,
> -						  off_t offset)
> +static int vfs_pwrite_state_destructor(struct vfs_gluster_pwrite_state *state)
>  {
> -	struct glusterfs_aio_state *state = NULL;
> -	struct tevent_req *req = NULL;
> -	int ret = 0;
> -	glfs_fd_t *glfd = vfs_gluster_fetch_glfd(handle, fsp);
> -
> -	if (glfd == NULL) {
> -		DBG_ERR("Failed to fetch gluster fd\n");
> -		return NULL;
> -	}
> +	return -1;
> +}
>  
> -	state = aio_state_create(mem_ctx);
> +static void vfs_pwrite_done(struct tevent_req *subreq)
> +{
> +	struct tevent_req *req = tevent_req_callback_data(
> +		subreq, struct tevent_req);
> +	struct vfs_gluster_pwrite_state *state = tevent_req_data(
> +		req, struct vfs_gluster_pwrite_state);
> +	int ret;
>  
> -	if (state == NULL) {
> -		return NULL;
> +	ret = pthreadpool_tevent_job_recv(subreq);
> +	TALLOC_FREE(subreq);
> +	SMBPROFILE_BYTES_ASYNC_END(state->profile_bytes);
> +	talloc_set_destructor(state, NULL);
> +	if (tevent_req_error(req, ret)) {
> +		return;
>  	}
>  
> -	req = state->req;
> -
> -	if (!init_gluster_aio(handle)) {
> -		tevent_req_error(req, EIO);
> -		return tevent_req_post(req, ev);
> -	}
> +	tevent_req_done(req);
> +}
>  
> -	/*
> -	 * aio_glusterfs_done and aio_tevent_fd_done()
> -	 * use the raw tevent context. We need to use
> -	 * tevent_req_defer_callback() in order to
> -	 * use the event context we're started with.
> -	 */
> -	tevent_req_defer_callback(req, ev);
> +static ssize_t vfs_gluster_pwrite_recv(struct tevent_req *req,
> +				       struct vfs_aio_state *vfs_aio_state)
> +{
> +	struct vfs_gluster_pwrite_state *state = tevent_req_data(
> +		req, struct vfs_gluster_pwrite_state);
>  
> -	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pread, profile_p,
> -				     state->profile_bytes, n);
> -	PROFILE_TIMESTAMP(&state->start);
> -	ret = glfs_pread_async(glfd, data, n, offset, 0, aio_glusterfs_done,
> -				state);
> -	if (ret < 0) {
> -		tevent_req_error(req, -ret);
> -		return tevent_req_post(req, ev);
> +	if (tevent_req_is_unix_error(req, &vfs_aio_state->error)) {
> +		return -1;
>  	}
>  
> -	return req;
> +	*vfs_aio_state = state->vfs_aio_state;
> +
> +	return state->ret;
>  }
>  
>  static struct tevent_req *vfs_gluster_pwrite_send(struct vfs_handle_struct
> @@ -961,78 +924,41 @@ static struct tevent_req *vfs_gluster_pwrite_send(struct vfs_handle_struct
>  						  const void *data, size_t n,
>  						  off_t offset)
>  {
> -	struct glusterfs_aio_state *state = NULL;
> -	struct tevent_req *req = NULL;
> -	int ret = 0;
> -	glfs_fd_t *glfd = vfs_gluster_fetch_glfd(handle, fsp);
> +	struct tevent_req *req, *subreq;
> +	struct vfs_gluster_pwrite_state *state;
>  
> +	glfs_fd_t *glfd = vfs_gluster_fetch_glfd(handle, fsp);
>  	if (glfd == NULL) {
>  		DBG_ERR("Failed to fetch gluster fd\n");
>  		return NULL;
>  	}
>  
> -	state = aio_state_create(mem_ctx);
> -
> -	if (state == NULL) {
> +	req = tevent_req_create(mem_ctx, &state, struct vfs_gluster_pwrite_state);
> +	if (req == NULL) {
>  		return NULL;
>  	}
>  
> -	req = state->req;
> -
> -	if (!init_gluster_aio(handle)) {
> -		tevent_req_error(req, EIO);
> -		return tevent_req_post(req, ev);
> -	}
> -
> -	/*
> -	 * aio_glusterfs_done and aio_tevent_fd_done()
> -	 * use the raw tevent context. We need to use
> -	 * tevent_req_defer_callback() in order to
> -	 * use the event context we're started with.
> -	 */
> -	tevent_req_defer_callback(req, ev);
> +	state->ret = -1;
> +	state->fd = glfd;
> +	state->buf = data;
> +	state->count = n;
> +	state->offset = offset;
>  
>  	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pwrite, profile_p,
>  				     state->profile_bytes, n);
> -	PROFILE_TIMESTAMP(&state->start);
> -	ret = glfs_pwrite_async(glfd, data, n, offset, 0, aio_glusterfs_done,
> -				state);
> -	if (ret < 0) {
> -		tevent_req_error(req, -ret);
> -		return tevent_req_post(req, ev);
> -	}
> -
> -	return req;
> -}
> -
> -static ssize_t vfs_gluster_recv(struct tevent_req *req,
> -				struct vfs_aio_state *vfs_aio_state)
> -{
> -	struct glusterfs_aio_wrapper *wrapper = NULL;
> -	int ret = 0;
> +	SMBPROFILE_BYTES_ASYNC_SET_IDLE(state->profile_bytes);
>  
> -	wrapper = tevent_req_data(req, struct glusterfs_aio_wrapper);
> -
> -	if (wrapper == NULL) {
> -		return -1;
> -	}
> -
> -	if (wrapper->state == NULL) {
> -		return -1;
> -	}
> -
> -	if (tevent_req_is_unix_error(req, &vfs_aio_state->error)) {
> -		return -1;
> +	subreq = pthreadpool_tevent_job_send(
> +		state, ev, handle->conn->sconn->pool,
> +		vfs_gluster_pwrite_do, state);
> +	if (tevent_req_nomem(subreq, req)) {
> +		return tevent_req_post(req, ev);
>  	}
> +	tevent_req_set_callback(subreq, vfs_pwrite_done, req);
>  
> -	*vfs_aio_state = wrapper->state->vfs_aio_state;
> -	ret = wrapper->state->ret;
> -
> -	/* Clean up the state, it is in a NULL context. */
> +	talloc_set_destructor(state, vfs_pwrite_state_destructor);
>  
> -	TALLOC_FREE(wrapper->state);
> -
> -	return ret;
> +	return req;
>  }
>  
>  static ssize_t vfs_gluster_pwrite(struct vfs_handle_struct *handle,
> @@ -1115,62 +1041,121 @@ static int vfs_gluster_renameat(struct vfs_handle_struct *handle,
>  	return ret;
>  }
>  
> +struct vfs_gluster_fsync_state {
> +	ssize_t ret;
> +	glfs_fd_t *fd;
> +
> +	struct vfs_aio_state vfs_aio_state;
> +	SMBPROFILE_BYTES_ASYNC_STATE(profile_bytes);
> +};
> +
> +static void vfs_fsync_do(void *private_data)
> +{
> +	struct vfs_gluster_fsync_state *state = talloc_get_type_abort(
> +		private_data, struct vfs_gluster_fsync_state);
> +	struct timespec start_time;
> +	struct timespec end_time;
> +
> +	SMBPROFILE_BYTES_ASYNC_SET_BUSY(state->profile_bytes);
> +
> +	PROFILE_TIMESTAMP(&start_time);
> +
> +	do {
> +#ifdef HAVE_GFAPI_VER_7_6
> +		state->ret = glfs_fsync(state->fd, NULL, NULL);
> +#else
> +		state->ret = glfs_fsync(state->fd);
> +#endif
> +	} while ((state->ret == -1) && (errno == EINTR));
> +
> +	if (state->ret == -1) {
> +		state->vfs_aio_state.error = errno;
> +	}
> +
> +	PROFILE_TIMESTAMP(&end_time);
> +
> +	state->vfs_aio_state.duration = nsec_time_diff(&end_time, &start_time);
> +
> +	SMBPROFILE_BYTES_ASYNC_SET_IDLE(state->profile_bytes);
> +}
> +
> +static int vfs_fsync_state_destructor(struct vfs_gluster_fsync_state *state)
> +{
> +	return -1;
> +}
> +
> +static void vfs_fsync_done(struct tevent_req *subreq)
> +{
> +	struct tevent_req *req = tevent_req_callback_data(
> +		subreq, struct tevent_req);
> +	struct vfs_gluster_fsync_state *state = tevent_req_data(
> +		req, struct vfs_gluster_fsync_state);
> +	int ret;
> +
> +	ret = pthreadpool_tevent_job_recv(subreq);
> +	TALLOC_FREE(subreq);
> +	SMBPROFILE_BYTES_ASYNC_END(state->profile_bytes);
> +	talloc_set_destructor(state, NULL);
> +
> +	if (tevent_req_error(req, ret)) {
> +		return;
> +	}
> +
> +	tevent_req_done(req);
> +}
> +
> +static int vfs_gluster_fsync_recv(struct tevent_req *req,
> +				  struct vfs_aio_state *vfs_aio_state)
> +{
> +	struct vfs_gluster_fsync_state *state = tevent_req_data(
> +		req, struct vfs_gluster_fsync_state);
> +
> +	if (tevent_req_is_unix_error(req, &vfs_aio_state->error)) {
> +		return -1;
> +	}
> +
> +	*vfs_aio_state = state->vfs_aio_state;
> +	return state->ret;
> +}
> +
>  static struct tevent_req *vfs_gluster_fsync_send(struct vfs_handle_struct
>  						 *handle, TALLOC_CTX *mem_ctx,
>  						 struct tevent_context *ev,
>  						 files_struct *fsp)
>  {
> -	struct tevent_req *req = NULL;
> -	struct glusterfs_aio_state *state = NULL;
> -	int ret = 0;
> -	glfs_fd_t *glfd = vfs_gluster_fetch_glfd(handle, fsp);
> +	struct tevent_req *req, *subreq;
> +	struct vfs_gluster_fsync_state *state;
>  
> +	glfs_fd_t *glfd = vfs_gluster_fetch_glfd(handle, fsp);
>  	if (glfd == NULL) {
>  		DBG_ERR("Failed to fetch gluster fd\n");
>  		return NULL;
>  	}
>  
> -	state = aio_state_create(mem_ctx);
> -
> -	if (state == NULL) {
> +	req = tevent_req_create(mem_ctx, &state, struct vfs_gluster_fsync_state);
> +	if (req == NULL) {
>  		return NULL;
>  	}
>  
> -	req = state->req;
> +	state->ret = -1;
> +	state->fd = glfd;
> +
> +	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_fsync, profile_p,
> +                                     state->profile_bytes, 0);
> +	SMBPROFILE_BYTES_ASYNC_SET_IDLE(state->profile_bytes);
>  
> -	if (!init_gluster_aio(handle)) {
> -		tevent_req_error(req, EIO);
> +	subreq = pthreadpool_tevent_job_send(
> +		state, ev, handle->conn->sconn->pool, vfs_fsync_do, state);
> +	if (tevent_req_nomem(subreq, req)) {
>  		return tevent_req_post(req, ev);
>  	}
> +	tevent_req_set_callback(subreq, vfs_fsync_done, req);
>  
> -	/*
> -	 * aio_glusterfs_done and aio_tevent_fd_done()
> -	 * use the raw tevent context. We need to use
> -	 * tevent_req_defer_callback() in order to
> -	 * use the event context we're started with.
> -	 */
> -	tevent_req_defer_callback(req, ev);
> +	talloc_set_destructor(state, vfs_fsync_state_destructor);
>  
> -	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_fsync, profile_p,
> -				     state->profile_bytes, 0);
> -	PROFILE_TIMESTAMP(&state->start);
> -	ret = glfs_fsync_async(glfd, aio_glusterfs_done, state);
> -	if (ret < 0) {
> -		tevent_req_error(req, -ret);
> -		return tevent_req_post(req, ev);
> -	}
>  	return req;
>  }
>  
> -static int vfs_gluster_fsync_recv(struct tevent_req *req,
> -				  struct vfs_aio_state *vfs_aio_state)
> -{
> -	/*
> -	 * Use implicit conversion ssize_t->int
> -	 */
> -	return vfs_gluster_recv(req, vfs_aio_state);
> -}
> -
>  static int vfs_gluster_stat(struct vfs_handle_struct *handle,
>  			    struct smb_filename *smb_fname)
>  {
> @@ -1871,10 +1856,10 @@ static struct vfs_fn_pointers glusterfs_fns = {
>  	.close_fn = vfs_gluster_close,
>  	.pread_fn = vfs_gluster_pread,
>  	.pread_send_fn = vfs_gluster_pread_send,
> -	.pread_recv_fn = vfs_gluster_recv,
> +	.pread_recv_fn = vfs_gluster_pread_recv,
>  	.pwrite_fn = vfs_gluster_pwrite,
>  	.pwrite_send_fn = vfs_gluster_pwrite_send,
> -	.pwrite_recv_fn = vfs_gluster_recv,
> +	.pwrite_recv_fn = vfs_gluster_pwrite_recv,
>  	.lseek_fn = vfs_gluster_lseek,
>  	.sendfile_fn = vfs_gluster_sendfile,
>  	.recvfile_fn = vfs_gluster_recvfile,
> -- 
> 2.21.0
> 


